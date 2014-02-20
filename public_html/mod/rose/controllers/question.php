<?php

include_once("{$CFG->dirroot}/local/soda/class.controller.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.question.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.dimension.php");

class question_controller extends controller {
      
    function __construct($mod_name, $mod_instance_id) {
        parent::__construct($mod_name, $mod_instance_id);
        $this->require_login();
        $this->dimension = \rose\dimension::load_by_id(required_param('dimension_id', PARAM_INT));
    } // function __construct


    function index($question_id = false, $selected_question = false) {
        global $USER, $COURSE, $CFG, $cm;
        $this->get_view(array('cm' => $cm,
            'dimension' => $this->dimension,
            'questions' => \rose\question::load_all_by_dimension_id_and_deleted($this->dimension->id, 0),
            'question_id' => $question_id,
            'selected_question' => $selected_question
        ));
    } // function index


    function create() {
        $question = new \rose\question($_REQUEST['question']);
        $question->rose_id = $this->rose_id;
        $question->dimension_id = $this->dimension->id;
        if (!$question->save()) return $this->index(false, $question);
        $this->redirect_to('index', array('dimension_id' => $this->dimension->id));
    } // function create


    function update($question_id) {
        $question = new \rose\question($_REQUEST['question']);
        if (!$question->save($question_id)) return $this->index($question_id, $question);
        $this->redirect_to('index', array('dimension_id' => $this->dimension->id));
    } // function update


    function delete($question_id) {
        $question = new \rose\question( array('deleted' => 1, 'id' => $question_id) );
        $question->delete();
        $this->redirect_to('index', array('dimension_id' => $this->dimension->id));
    } // function delete
    
} // question_controller 
