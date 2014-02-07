<?php
include_once("{$CFG->dirroot}/local/soda/class.controller.php");

class repeatcourse_controller extends controller {

    function index() {
        global $DB ,$PAGE;
        $curCoursesNames = "";
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/functions.js");
        $repeatCourseId = $DB->get_record('course_categories', array('name' => 'Repeat Courses'), 'id'); //courses from "Repeat Corse" category
        $curCourses = $DB->get_records_sql('SELECT id, name, ordering, cinterval FROM {repeatcourse} WHERE course = '.$repeatCourseId->id." ORDER BY ordering"); //courses from mod_repeatcourse table
        foreach($curCourses as $c){
            $curCoursesNames .= '"'.$c->name.'",';
        }
        $curCoursesNames = rtrim($curCoursesNames, ',');
        $repeatCourses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE category = "'.$repeatCourseId->id.'" AND fullname NOT IN('.$curCoursesNames.')');
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
        $repeatCourseId = $DB->get_record('course_categories', array('name' => 'Repeat Courses'), 'id');
        $record = new stdClass();
        $record->cinterval = optional_param('interval', 0, PARAM_INT);
        $record->name = optional_param('coursename', '', PARAM_NOTAGS);
        $record->introformat = 1;
        $record->introformat = 0;
        $record->timemodified = 0;
        $record->ordering = 0;
        $record->course = $repeatCourseId;//$this->course->id;
        $insertedId = $DB->insert_record('repeatcourse', $record);
        return $insertedId;
    }

    function delete_repcourse(){
        global $DB;
        $this->no_layout = true;
        $repCourseId = optional_param('rep_id', 0, PARAM_INT);
        if($repCourseId != 0){
            return $DB->delete_records('repeatcourse', array('id' => $repCourseId));
        } else{
            return false;
        }
    }

} // class repeatcourse_controller 
