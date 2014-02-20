<?php

include_once("{$CFG->dirroot}/local/soda/class.controller.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.dimension.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.question.php");

class dimension_controller extends controller {
      
    function __construct($mod_name, $mod_instance_id) {
        parent::__construct($mod_name, $mod_instance_id);
        $this->require_login();
    } // function __construct


    function index($dimension_id = false, $selected_dimension = false) {
        global $USER, $COURSE, $CFG, $cm;
        $this->get_view(array('cm' => $cm,
            'dimensions' => \rose\dimension::load_all_by_rose_id_and_deleted($this->rose_id, 0),
            'questions' => \rose\question::load_all_by_rose_id_and_deleted($this->rose_id, 0),
            'dimension_id' => $dimension_id,
            'selected_dimension' => $selected_dimension
        ));
    } // function index


    function create() {
        $dimension = new \rose\dimension($_REQUEST['dimension']);
        $dimension->rose_id = $this->rose_id;
        if (!$dimension->save()) return $this->index(false, $dimension);
        $this->redirect_to('index');
    } // function create


    function update($dimension_id) {
        $dimension = new \rose\dimension($_REQUEST['dimension']);
        if (!$dimension->save($dimension_id)) return $this->index($dimension_id, $dimension);
        $this->redirect_to('index');
    } // function update


    function delete($dimension_id) {
        $dimension = new \rose\dimension( array('deleted' => 1, 'id' => $dimension_id) );
        $dimension->delete();
        $this->redirect_to('index');               
    } // function delete
    
} // dimension_controller 
