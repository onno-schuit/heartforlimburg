<?php
include_once("{$CFG->dirroot}/local/soda/class.controller.php");

class repeatcourse_controller extends controller {

    function index() {
        global $DB ,$PAGE;

        $curCoursesNames = '';
        $isMCourseExist = array();
        
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/functions.js");
        
        $repCourseCat = $DB->get_record_sql('SELECT id FROM {course_categories} WHERE name = "'.get_string('repcoursecategoryname', 'repeatcourse').'"');
        
        $mainCourseId = optional_param('maincourseid', 0, PARAM_INT);
        /*if($mainCourseId == 0){
        	$isMCourseExist = $DB->get_records_sql('SELECT id FROM {repeatcourse_records} WHERE repeatcourse = '. $this->course->id);
        }*/

        //if(sizeof($isMCourseExist) > 0 || $mainCourseId > 0){
        if($mainCourseId > 0){
        	$curCourses = $DB->get_records_sql('SELECT id, name, ordering, cinterval FROM {repeatcourse_records} WHERE maincourseid = "'.$mainCourseId.'" ORDER BY ordering');
        	
        	if(sizeof($curCourses)){
        		$curCoursesNames = 'AND fullname  NOT IN (';
        		foreach($curCourses as $c){
        			$curCoursesNames .= '"'.$c->name.'",';
        		}
        		$curCoursesNames = rtrim($curCoursesNames, ',');
        		$curCoursesNames .= ')';
        	}
        	$repeatCourses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category = "'.$repCourseCat->id.'" '.$curCoursesNames . ' AND lang IN ("", "'.current_language().'")');
        	//TODO:change structure {repeatcorse}. maybe add a field with associated course id or to exclude other courses..
        	
        	$this->get_view(array(
        			'repeatCourses' => $repeatCourses,
        			'curCourses'    => $curCourses,
        	));
        } else {
        	$mainCourseArr = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category <> "'.$repCourseCat->id.'"');
        	$mainCourseStr = '';
        	foreach($mainCourseArr as $mc){
        		$mainCourseStr .= $mc->id . ',';
        	}
        	$mainCourseStr = rtrim($mainCourseStr, ',');
        	
        	//$repMainCourseArr = $DB->get_records_sql('SELECT maincourseid, repeatcourse, name FROM {repeatcourse_records} WHERE repeatcourse NOT IN (' . $mainCourseStr . ') ORDER BY ordering');
            
            $resultRCArr = $DB->get_records_sql('
                SELECT rc.id AS rcid, rc.maincourseid AS mid, rc.repeatcourse AS rid, rc.name AS rcname, mc.fullname 
                FROM {course} AS mc  LEFT JOIN {repeatcourse_records} AS rc ON rc.maincourseid = mc.id
                WHERE rc.repeatcourse NOT IN (' . $mainCourseStr . ') ORDER BY rc.ordering ASC
            ');
            $resArr = array();
            foreach($resultRCArr as $rc){
                if(@$resArr[$rc->mid]){
                    $resArr[$rc->mid] .= $rc->rcname . ', ';
                } else {
                    $resArr[$rc->mid] = $rc->rcname . ', ';
                }
            }
            $resultRCArr = $DB->get_records_sql('
                SELECT rc.id AS rcid, rc.maincourseid AS mid, rc.repeatcourse AS rid, rc.name AS rcname, mc.fullname FROM {course} AS mc 
                LEFT JOIN {repeatcourse_records} AS rc ON rc.maincourseid = mc.id WHERE rc.repeatcourse NOT IN (' . $mainCourseStr . ')
                GROUP BY rc.maincourseid ORDER BY rc.ordering ASC
            ');
            
//echo "<pre>"; print_r($resArr); die;
        	$this->get_view(array(
        			'mainCourses'    => $mainCourseArr,
        			'resultArray'    => $resultRCArr,
                    'resArr'         => $resArr 
        	));
        }
    } // function index


    function show() {
    } // function show


    function edit() {
    } // function edit


    function delete() {
    } // function delete


    function create() {
        // To use the 'flash' message, provide a 3rd argument to redirect_to, containing the actual message:
        // $this->redirect_to( 'index', array('saved' => 1), array('notification' => get_string('message_saved', 'repeatcourse')));
    } // function create

    function add_repcourse(){
        global $DB;
        $this->no_layout = true;

        $mainCourseId = optional_param('maincourseid', 0, PARAM_INT);
        $repeatCourseId = optional_param('selected_course_id', 0, PARAM_INT);
        if($mainCourseId == 0 || $repeatCourseId == 0){ return false; }

        $lastOrderObj = $DB->get_record_sql('SELECT MAX(ordering) as maxord FROM {repeatcourse_records} WHERE maincourseid = "'. $mainCourseId . '"');
        $lastOrder = ($lastOrderObj->maxord === NULL) ? 0 : $lastOrderObj->maxord;

        $record = new stdClass();
        $record->maincourseid = $mainCourseId;
        $record->repeatcourse = $repeatCourseId;
        $record->name = optional_param('coursename', '', PARAM_NOTAGS);
        $record->timemodified = time();
        $record->ordering = $lastOrder+1;
        $record->cinterval = optional_param('interval', 0, PARAM_INT);
error_log(var_export($record, true));return false;
        try {
			$transaction = $DB->start_delegated_transaction();
            $DB->insert_record('repeatcourse_records', $record);
			$transaction->allow_commit();
		} catch (Exception $e) {
			//extra cleanup steps
			$transaction->rollback($e); // rethrows exception
		}
        return true;
    }

    function delete_repcourse(){
        global $DB;
        $this->no_layout = true;
        $repCourseId = optional_param('rep_id', 0, PARAM_INT);
        if($repCourseId > 0){
            return $DB->delete_records('repeatcourse_records', array('id' => $repCourseId));
        } else{
            return false;
        }
    }
    
    function ordering_up(){
    	global $DB;
    	$orderArr = array();
    	$this->no_layout = true;
    	$repCourseId = optional_param('rep_course_id', 0, PARAM_INT);
    	if($repCourseId > 0){
    		$orderings = $DB->get_records('repeatcourse_records', array(), 'ordering', 'id, ordering');
    		foreach($orderings as $order){
    			$orderArr[$order->id] = $order->ordering;
    		}
    		asort($orderArr);//assoc array sorted ASC by values: [1]=>1, [3]=>2
    		
    		$repCourseOrderCur = $DB->get_record_sql('SELECT ordering FROM {repeatcourse_records} WHERE id = :id', array('id' => $repCourseId));//2

    		$repCourseOrderIdCur = array_search($repCourseOrderCur->ordering, $orderArr);//1
    		$repCourseOrderIdPrev = self::incrementDecrementKey($repCourseOrderIdCur, $orderArr, false);//1--1

    		$curObject = new stdClass();
    		$curObject->id = $repCourseOrderIdCur;//3
    		$curObject->ordering = $orderArr[$repCourseOrderIdPrev];//1

    		$prevObject = new stdClass();
    		$prevObject->id = $repCourseOrderIdPrev;//1
    		$prevObject->ordering = $repCourseOrderCur->ordering;//2

    		try {
    			$transaction = $DB->start_delegated_transaction();
    			$DB->update_record('repeatcourse_records', $curObject);
    			$DB->update_record('repeatcourse_records', $prevObject);

    			$transaction->allow_commit();
    		} catch (Exception $e) {
    			//extra cleanup steps
    			$transaction->rollback($e); // rethrows exception
    		}
    		return true;
    	}
    	return false;
    }
    
    function ordering_down(){
    	global $DB;
    	$orderArr = array();
    	$this->no_layout = true;
    	$repCourseId = optional_param('rep_course_id', 0, PARAM_INT);
    	if($repCourseId > 0){
    		$orderings = $DB->get_records('repeatcourse_records', array(), 'ordering', 'id, ordering');
    		foreach($orderings as $order){
    			$orderArr[$order->id] = $order->ordering;
    		}
    		asort($orderArr);//assoc array sorted ASC by values: [1]=>1, [3]=>2
    	
    		$repCourseOrderCur = $DB->get_record_sql('SELECT ordering FROM {repeatcourse_records} WHERE id = :id', array('id' => $repCourseId));
    	
    		$repCourseOrderIdCur = array_search($repCourseOrderCur->ordering, $orderArr);
    		$repCourseOrderIdPrev = self::incrementDecrementKey($repCourseOrderIdCur, $orderArr, true);
    	
    		$curObject = new stdClass();
    		$curObject->id = $repCourseOrderIdCur;
    		$curObject->ordering = $orderArr[$repCourseOrderIdPrev];
    	
    		$prevObject = new stdClass();
    		$prevObject->id = $repCourseOrderIdPrev;
    		$prevObject->ordering = $repCourseOrderCur->ordering;
    	
    		try {
    			$transaction = $DB->start_delegated_transaction();
    			$DB->update_record('repeatcourse_records', $curObject);
    			$DB->update_record('repeatcourse_records', $prevObject);

    			$transaction->allow_commit();
    		} catch (Exception $e) {
    			//extra cleanup steps
    			$transaction->rollback($e); // rethrows exception
    		}
    		return true;
    	}
    	return false;
    }
    
    function incrementDecrementKey($key, $array, $isInc){
    	$keys = array_keys($array);
    	$keys_flip = array_flip(array_keys($array));
    	if($isInc){
    		return $keys[$keys_flip[$key]+1];
    	} else {
    		return $keys[$keys_flip[$key]-1];
    	}
    }

} // class repeatcourse_controller 
