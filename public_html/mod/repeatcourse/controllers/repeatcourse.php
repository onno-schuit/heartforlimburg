<?php
include_once("{$CFG->dirroot}/local/soda/class.controller.php");

class repeatcourse_controller extends controller {

    function index() {
        global $DB, $CFG, $PAGE, $USER;

        require_login($this->course);
        if(!is_siteadmin($USER->id)){ //TODO:change smth in /db/access.php and comment code right here.
            redirect($CFG->wwwroot.'/login/index.php');
        }
        
        /*$cmid = required_param('id', PARAM_INT);
        $cm = get_coursemodule_from_id('repeatcourse', $cmid);//, 0, false, MUST_EXIST);

        $context = get_context_instance(CONTEXT_MODULE, $cm->id);
        
        require_capability('mod/repeatcourse:read', $context);*/

        $curCoursesNames = '';
        $isMCourseExist = array();
        
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/functions.js");
        
        $repCourseCat = $DB->get_record_sql('SELECT id FROM {course_categories} WHERE idnumber = "repeatcourse"');

		
        $mainCourseId = optional_param('maincourseid', 0, PARAM_INT);
        
        $mainCourseName = $this->course->fullname;
        
        /*if($mainCourseId == 0){
        	$isMCourseExist = $DB->get_records_sql('SELECT id FROM {repeatcourse_records} WHERE repeatcourse = '. $this->course->id);
        }*/

        //if(sizeof($isMCourseExist) > 0 || $mainCourseId > 0){
		//----------------------------------------------------------------------------------------------------------------------------------
		// Edit courses screen
		//----------------------------------------------------------------------------------------------------------------------------------
        if($mainCourseId > 0){
            $mainCourseNameObj = $DB->get_record('course', array('id' => $mainCourseId), 'fullname');
            $mainCourseName = $mainCourseNameObj->fullname;
        	$curCourses = $DB->get_records_sql('
        			SELECT rr.id, rr.repeatcourse, rr.ordering, rr.cinterval, cc.fullname AS name
        			FROM {repeatcourse_records} as rr
        			LEFT JOIN {course} as cc ON cc.id = rr.repeatcourse 
        			WHERE rr.maincourseid = "'.$mainCourseId.'" 
        			ORDER BY rr.ordering');
        	
        	if(sizeof($curCourses)){
        		$curCoursesNames = 'AND fullname  NOT IN (';
        		foreach($curCourses as $c){
        			$curCoursesNames .= '"'.$c->name.'",';
        		}
        		$curCoursesNames = rtrim($curCoursesNames, ',');
        		$curCoursesNames .= ')';
        	}
        	$repeatCourses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category = "'.$repCourseCat->id.'" '.$curCoursesNames . ' AND lang IN ("", "'.current_language().'")');
        	//TODO:change structure {repeatcourse}. maybe add a field with associated course id or to exclude other courses..
        	
        	$this->get_view(array(
        			'repeatCourses' => $repeatCourses,
        			'curCourses'    => $curCourses,
                    'mainCourseName' => $mainCourseName,
        	));
        } 
		//----------------------------------------------------------------------------------------------------------------------------------
		// Index screen
		//----------------------------------------------------------------------------------------------------------------------------------
		else {
        	$mainCourseArr = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category <> "'.$repCourseCat->id.'" AND id != 1');
        	$mainCourseStr = '';
        	foreach($mainCourseArr as $mc){
        		$mainCourseStr .= $mc->id . ',';
        	}
        	$mainCourseStr = rtrim($mainCourseStr, ',');
        	
        	//$repMainCourseArr = $DB->get_records_sql('SELECT maincourseid, repeatcourse, name FROM {repeatcourse_records} WHERE repeatcourse NOT IN (' . $mainCourseStr . ') ORDER BY ordering');
            
            $resultRCArr = $DB->get_records_sql('
                SELECT rc.id AS rcid, rc.maincourseid AS mid, rc.repeatcourse AS rid, mc.fullname, "" AS rcname
                FROM {course} AS mc  LEFT JOIN {repeatcourse_records} AS rc ON rc.maincourseid = mc.id
                WHERE rc.repeatcourse NOT IN (' . $mainCourseStr . ') ORDER BY rc.ordering ASC
            ');

            $resArr = array();
            foreach($resultRCArr as $rc){
            	$rcn = $DB->get_record('course', array('id' => $rc->rid), 'fullname AS rcname');
            	$rcn->rcname;
            	if(@$resArr[$rc->mid]){
            		$resArr[$rc->mid] .= $rcn->rcname . ', ';
            	} else {
            		$resArr[$rc->mid] = $rcn->rcname . ', ';
            	}
            }
            $resultRCArr = $DB->get_records_sql('
                SELECT rc.id AS rcid, rc.maincourseid AS mid, rc.repeatcourse AS rid, "" AS rcname, mc.fullname FROM {course} AS mc 
                LEFT JOIN {repeatcourse_records} AS rc ON rc.maincourseid = mc.id WHERE rc.repeatcourse NOT IN (' . $mainCourseStr . ')
                GROUP BY rc.maincourseid ORDER BY rc.ordering ASC
            ');
            
// echo "<pre>"; print_r($resArr); die;
        	$this->get_view(array(
        			'mainCourses'    => $mainCourseArr,
        			'resultArray'    => $resultRCArr,
                    'resArr'         => $resArr,
                    'mainCourseName' => $mainCourseName,
        	));
        }
    } // function index
    
    function optin(){
        global $DB, $PAGE, $USER;
        
        require_login($this->course);
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/optin_screen.js");

        $curId          = optional_param('id', 0, PARAM_INT);
        $mainCourseId   = optional_param('maincourseid', 0, PARAM_INT);
        $userId         = $USER->id;
        //$mainCourseName = $this->course->fullname;
        $mainCourseName = $DB->get_field('course', 'fullname', array('id' => $mainCourseId));
        
        $isCurUser = $DB->get_record('course_completions_repcourse', array('userid' => $userId, 'maincourseid' => $mainCourseId));
        if(@$isCurUser->mailing == 1) {$isMailing = 1;} else {$isMailing = 0;} 
        $isCurUser = ($isCurUser) ? 1 : 0;
        
        $this->get_view(array(
            'mainCourseId'  => $mainCourseId,
            'userId'        => $userId,
            'mainCourseName'=> $mainCourseName,
            'curId'         => $curId,
            'isCurUser'     => $isCurUser,
            'isMailing'     => $isMailing,
        ));
    }
    
    function optin_save(){
        global $DB, $PAGE, $USER;
        
        require_login($this->course);
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/optin_screen.js");
        
        $curId          = optional_param('id', 0, PARAM_INT);
        $mainCourseId   = optional_param('maincourseid', 0, PARAM_INT);
        $isMailing      = optional_param('ismailing', 0, PARAM_INT);
        $userId         = $USER->id;
        //$mainCourseName = $this->course->fullname;
        $mainCourseName = $DB->get_field('course', 'fullname', array('id' => $mainCourseId));
              
        $curUserCompletion = $DB->get_record('course_completions_repcourse', array('userid' => $userId, 'maincourseid' => $mainCourseId));

		$record = new stdClass();
		$record->userid         = $userId;
		$record->maincourseid = $mainCourseId;
		$record->mailing = $isMailing;

        $isCurUser = ($curUserCompletion != null) ? 1 : 0;
        if($isCurUser)
		{
 			$record->id = $curUserCompletion->id;
			//$DB->execute('UPDATE {course_completions_repcourse} SET `mailing`=:ismailing WHERE userid=:userid AND maincourseid=:maincourseid', $params);
			$DB->update_record('course_completions_repcourse', $record, false);        
		} 
		else 
		{
			$DB->insert_record('course_completions_repcourse', $record, false);        
            //$DB->execute('INSERT INTO {course_completions_repcourse} (userid, maincourseid, mailing) VALUES (:userid, :maincourseid, :ismailing)', $params);
        }
        
        $this->get_view(array(
            'mainCourseId'  => $mainCourseId,
            'userId'        => $userId,
            'mainCourseName'=> $mainCourseName,
            'curId'         => $curId,
            'isCurUser'     => $isCurUser,
            'isMailing'     => $isMailing,
        ), 'optin');
    }

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
		//$this->no_layout = true;

        require_login($this->course);

        $main_id = optional_param('id', 0, PARAM_INT);
        $mainCourseId = optional_param('maincourseid', 0, PARAM_INT);
        $repeatCourseId = optional_param('selected_course_id', 0, PARAM_INT);

		if($mainCourseId == 0 || $repeatCourseId == 0)
		{ 
			$this->redirect_to('index', array(), array('error' => get_string('standard_error', 'repeatcourse')));
		}

        $lastOrderObj = $DB->get_record_sql('SELECT MAX(ordering) as maxord FROM {repeatcourse_records} WHERE maincourseid = "'. $mainCourseId . '"');
        $lastOrder = ($lastOrderObj->maxord === NULL) ? 0 : $lastOrderObj->maxord;

        $record = new stdClass();
        $record->maincourseid = $mainCourseId;
        $record->repeatcourse = $repeatCourseId;
        $record->timemodified = time();
        $record->ordering = $lastOrder+1;
        $record->cinterval = optional_param('interval', 0, PARAM_INT);
		
		$DB->insert_record('repeatcourse_records', $record);

		$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('notification' => get_string('course_added', 'repeatcourse')));

		/*
        try {
			$transaction = $DB->start_delegated_transaction();
			//$DB->insert_record('repeatcourse_records', $record);
            $DB->execute("INSERT INTO {repeatcourse_records} (maincourseid, repeatcourse,timemodified,ordering,cinterval) VALUES('" . $record->maincourseid . "', '" . $record->repeatcourse . "','" . $record->timemodified . "','" . $record->ordering . "','" . $record->cinterval . "')");
			$transaction->allow_commit();
		} catch (Exception $e) {
			//extra cleanup steps
			$transaction->rollback($e); // rethrows exception
            error_log(var_export($e, true));
			return false;
		}
        return true;
		*/
    }

    function delete_repcourse(){
        global $DB;
        //$this->no_layout = true;

        require_login($this->course);

		$mainCourseId = optional_param('maincourseid', 0, PARAM_INT);
        $repCourseId = optional_param('rep_id', 0, PARAM_INT);
        if($repCourseId > 0)
		{
            $DB->delete_records('repeatcourse_records', array('id' => $repCourseId));
			
			self::renumber_order_for_courses($mainCourseId);

			$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('notification' => get_string('course_deleted', 'repeatcourse')));
        } 
		else
		{
			$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('error' => get_string('standard_error', 'repeatcourse')));
        }
    }
    
    function ordering_up(){
    	global $DB;
    	$orderArr = array();
    	//$this->no_layout = true;

        require_login($this->course);

		$mainCourseId = optional_param('maincourseid', 0, PARAM_INT);

    	$repCourseId = optional_param('rep_course_id', 0, PARAM_INT);
    	if($repCourseId > 0){
    		$orderings = $DB->get_records('repeatcourse_records', array('maincourseid' => $mainCourseId), 'ordering', 'id, ordering');
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

   			$DB->update_record('repeatcourse_records', $curObject);
   			$DB->update_record('repeatcourse_records', $prevObject);

			$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('notification' => get_string('ordening_changed', 'repeatcourse')));

    		/*
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
			*/
    	}
    	
		$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('error' => get_string('standard_error', 'repeatcourse')));
		//return false;
    }
    
    function ordering_down(){
    	global $DB;
    	$orderArr = array();
    	//$this->no_layout = true;

        require_login($this->course);

		$mainCourseId = optional_param('maincourseid', 0, PARAM_INT);

    	$repCourseId = optional_param('rep_course_id', 0, PARAM_INT);
    	if($repCourseId > 0){
    		$orderings = $DB->get_records('repeatcourse_records', array('maincourseid' => $mainCourseId), 'ordering', 'id, ordering');
    		foreach($orderings as $order){
    			$orderArr[$order->id] = $order->ordering;
    		}
    		asort($orderArr);//assoc array sorted ASC by values: [1]=>1, [3]=>2

					print_object($orderArr);

    		$repCourseOrderCur = $DB->get_record_sql('SELECT ordering FROM {repeatcourse_records} WHERE id = :id', array('id' => $repCourseId));

    		$repCourseOrderIdCur = array_search($repCourseOrderCur->ordering, $orderArr);
    		$repCourseOrderIdPrev = self::incrementDecrementKey($repCourseOrderIdCur, $orderArr, true);
    	
    		$curObject = new stdClass();
    		$curObject->id = $repCourseOrderIdCur;
    		$curObject->ordering = $orderArr[$repCourseOrderIdPrev];
    	
    		$prevObject = new stdClass();
    		$prevObject->id = $repCourseOrderIdPrev;
    		$prevObject->ordering = $repCourseOrderCur->ordering;

			$DB->update_record('repeatcourse_records', $curObject);
   			$DB->update_record('repeatcourse_records', $prevObject);

			$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('notification' => get_string('ordening_changed', 'repeatcourse')));

			/*
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
			*/
    	}

		$this->redirect_to('index', array('maincourseid' => $mainCourseId), array('error' => get_string('standard_error', 'repeatcourse')));
		//return false;
    }
    
    function incrementDecrementKey($key, $array, $isInc){
    	$keys = array_keys($array);
    	$keys_flip = array_flip($keys);
    	if($isInc){
    		return $keys[$keys_flip[$key]+1];
    	} else {
    		return $keys[$keys_flip[$key]-1];
    	}
    }
    
    function main_course_remova(){
        require_login($this->course);

    	$mcid = optional_param('mcid', 0, PARAM_INT);
    	if($mcid == 0)
		{ 
			$this->redirect_to('index', array(), array('error' => get_string('standard_error', 'repeatcourse')));
		}

    	global $DB;
    	//$this->no_layout = true;

   		$DB->delete_records_select('repeatcourse_records', 'maincourseid = :mcid', array('mcid' => $mcid));
		$this->redirect_to('index', array(), array('notification' => get_string('all_courses_deleted', 'repeatcourse')));

    	/*
		try {
    		$transaction = $DB->start_delegated_transaction();
    		$DB->delete_records_select('repeatcourse_records', 'maincourseid = :mcid', array('mcid' => $mcid));
    		$transaction->allow_commit();
    	} catch (Exception $e) {
    		//extra cleanup steps
    		$transaction->rollback($e); // rethrows exception
    		return false;
    	}
    	return true;
		*/

    }

	static function renumber_order_for_courses($maincourseid)
	{
		global $DB;

		$repeat_courses = $DB->get_records('repeatcourse_records', array('maincourseid' => $maincourseid), 'ordering ASC');
		
		$i = 1;
		foreach ($repeat_courses as $repeat_course)
		{
			$record = new stdClass();
			$record->id = $repeat_course->id;
			$record->ordering = $i++;

			$DB->update_record('repeatcourse_records', $record);
		}
	}

} // class repeatcourse_controller 
