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
        $repeatCourses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category = "'.$this->course->category.'" '.$curCoursesNames);
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
        if($repCourseId != 0){
            return $DB->delete_records('repeatcourse_records', array('id' => $repCourseId));
        } else{
            return false;
        }
    }

} // class repeatcourse_controller 
