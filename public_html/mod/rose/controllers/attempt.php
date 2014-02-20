<?php

include_once("{$CFG->dirroot}/local/soda/class.controller.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.dimension.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.question.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.attempt.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.answer.php");

class attempt_controller extends controller {
      
    function __construct($mod_name, $mod_instance_id) {
        parent::__construct($mod_name, $mod_instance_id);
        $this->require_login();
    } // function __construct


    function index() {
        global $USER;
        $user_id = optional_param('user_id', $USER->id, PARAM_INT);
        if (! $attempts = \rose\attempt::load_all_by_rose_id_and_user_id_and_deleted($this->rose_id, $user_id, 0)) {
            return $this->show();
        }
        if (count($attempts) == 1) {
            $attempt = $attempts[0];
            // go to questions form if you haven't completed at least one attempt
            if (!$attempt->date_completed) return $this->redirect_to('show', array('attempt_id' => $attempt->id));
        }
        $this->get_view(array('attempts' => $attempts));        
    } // function index


    function show() {
        global $USER;
        $user_id = optional_param('user_id', $USER->id, PARAM_INT);
        $attempt_id = optional_param('attempt_id', false, PARAM_INT);
        $questions = \rose\question::load_with_answers($this->rose_id, $attempt_id, $user_id);
        list($previous_questions, $current_questions) = $this->sort_questions($questions);
        shuffle($current_questions);
        $this->get_view(
            array(
                'questions' => array_merge($previous_questions, $current_questions),
                'attempt_id' => $attempt_id
            )
        );        
    } // function show


    /**
     * Returns an array with array of previous questions (answered) 
     * and an array of current questions (unanswered)
     */
    function sort_questions($questions) {
        $previous_questions = array();
        $current_questions = array();

        foreach($questions as $question) {
            if (property_exists($question, 'answer')) {
                $previous_questions[] = $question;
            } else {
                $current_questions[] = $question;
            }
        }
        return array($previous_questions, $current_questions);
    } // function sort_questions


    function save() {
        global $USER, $DB;
        $attempt_id = optional_param('attempt_id', false, PARAM_INT);
        if (!$raw_answers = $this->get_proper_answers()) {
            return $this->redirect_to('show', array('attempt_id' => $attempt_id));
        }
        $attempt = $this->retrieve_or_create_attempt($USER->id, $attempt_id);
        $answers = \rose\answer::instantiate_all($raw_answers, array('attempt_id' => $attempt->id, 'user_id' => $USER->id, 'rose_id' => $this->rose_id));
        \rose\answer::save_all($answers);
        $this->save_attempt_if_completed($attempt);
        $this->redirect_to('show', array('attempt_id' => $attempt->id));
    } // function save


    function save_attempt_if_completed($attempt) {
        global $USER, $DB;        
        $questions = \rose\question::load_all_by_rose_id_and_deleted($this->rose_id, 0);
        $answers_count = $DB->count_records('rose_answers', array('user_id' => $USER->id, 'rose_id' => $this->rose_id, 'attempt_id' => $attempt->id));
        if ($answers_count == count($questions)) {
            $attempt->date_completed = date('Y-m-d H:i:s',time());
            $attempt->save();
            return $this->redirect_to('radarchart', array('attempt_id' => $attempt->id));
        }
    } // function save_attempt_if_completed 


    function get_proper_answers() {
        if (! array_key_exists('answers', $_REQUEST)) return false;
        return array_filter($_REQUEST['answers'], function($answer) {return array_key_exists('value', $answer);});
    } // function any_answers


    function retrieve_or_create_attempt($user_id, $attempt_id = false) {
        if ( (!$attempt_id) || ($attempt_id == 0) ) {
            $attempt = new \rose\attempt(array('rose_id' => $this->rose_id, 'user_id' => $user_id, 'date_started' => date('Y-m-d H:i:s',time())));
            $attempt->save();
            return $attempt;
        }
        return \rose\attempt::load_by_id($attempt_id);
    } // function retrieve_or_create_attempt


    function radarchart() {
        global $USER, $rose;

        $user_id = optional_param('user_id', $USER->id, PARAM_INT);
        $attempt_id = required_param('attempt_id', PARAM_INT);

        $dimensions = \rose\dimension::load_all_by_rose_id_and_deleted($this->rose_id, 0);
        $answers = \rose\answer::load_all_by_attempt_id_and_user_id($attempt_id, $user_id);


        $this->get_view(array('answers' => $answers, 'dimensions' => $dimensions, 'rose' => $rose));
    } // function radarchart

} // class attempt_controller 
