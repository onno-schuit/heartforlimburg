<?php
include_once("{$CFG->dirroot}/local/soda/class.controller.php");

class repeatcourse_controller extends controller {

    function index() {
        global $DB ,$PAGE;
        $PAGE->requires->js("/lib/jquery/jquery-1.10.2.min.js");
        $PAGE->requires->js("/mod/repeatcourse/media/js/functions.js");
        $repeatCourseId = $DB->get_record('course_categories', array('name' => 'Repeat Courses'), 'id'); //courses from "Repeat Corse" category
        $repeatCourses = $DB->get_records('course', array('category'=>$repeatCourseId->id), '', 'id, fullname');
        $curCourses = $DB->get_records_sql('SELECT id, name, ordering, cinterval FROM {repeatcourse} WHERE course = '.$repeatCourseId->id." ORDER BY ordering"); //courses from mod_repeatcourse table

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

} // class repeatcourse_controller 

?>
