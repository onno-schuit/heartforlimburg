<?php
include_once("{$CFG->dirroot}/local/soda/class.controller.php");

class repeatcourse_controller extends controller {

    function index() {
        global $DB ,$PAGE;

        $curCoursesNames = '';
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/functions.js");

        $curCourses = $DB->get_records_sql('SELECT id, name, ordering, cinterval FROM {repeatcourse_records} WHERE `repeatcourse` = '.$this->course->id.' ORDER BY ordering');       

        if(sizeof($curCourses)){
        	$curCoursesNames = 'AND fullname  NOT IN (';
        	foreach($curCourses as $c){
        		$curCoursesNames .= '"'.$c->name.'",';
        	}
        	$curCoursesNames = rtrim($curCoursesNames, ',');
        	$curCoursesNames .= ')';
        }
        $repeatCourses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category = "'.$this->course->category.'" '.$curCoursesNames . ' AND lang IN ("", "'.current_language().'")');
//TODO:change structure {repeatcorse}. maybe add a field with associated course id or to exclude other courses..

        $this->get_view(array(
            'repeatCourses' => $repeatCourses,
            'curCourses'    => $curCourses,
        ));
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
        
        $lastOrderObj = $DB->get_record_sql('SELECT MAX(ordering) as maxord FROM {repeatcourse_records} WHERE repeatcourse = '. $this->course->id);
        $lastOrder = ($lastOrderObj->maxord === NULL) ? 0 : $lastOrderObj->maxord;

        $record = new stdClass();
        $record->repeatcourse = $this->course->id;
        $record->name = optional_param('coursename', '', PARAM_NOTAGS);
        $record->timemodified = time();
        $record->ordering = $lastOrder+1;
        $record->cinterval = optional_param('interval', 0, PARAM_INT);

        $insertedId = $DB->insert_record('repeatcourse_records', $record);
        return $insertedId;
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
    			// Perform some $DB stuff
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
    	
    		$repCourseOrderCur = $DB->get_record_sql('SELECT ordering FROM {repeatcourse_records} WHERE id = :id', array('id' => $repCourseId));//2
    	
    		$repCourseOrderIdCur = array_search($repCourseOrderCur->ordering, $orderArr);//1
    		$repCourseOrderIdPrev = self::incrementDecrementKey($repCourseOrderIdCur, $orderArr, true);//1--1
    	
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
    			// Perform some $DB stuff
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
