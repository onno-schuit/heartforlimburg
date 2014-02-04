<?php
include_once("{$CFG->dirroot}/local/soda/class.controller.php");

class repeatcourse_controller extends controller {

    function index() {
        global $DB;
        $courses = array();

        $user_id = optional_param('user_id', 0, PARAM_INT);
        if($user_id) {
            $courses = $DB->get_records_sql('SELECT * FROM {course_categories} WHERE '. $DB->sql_like('name', ':repeat course'));
        }

        $this->get_view();
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
