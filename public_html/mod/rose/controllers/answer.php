<?php

include_once("{$CFG->dirroot}/local/soda/class.controller.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.dimension.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.question.php");
include_once("{$CFG->dirroot}/mod/rose/models/class.answer.php");

class answer_controller extends controller {
      
    function __construct($mod_name, $mod_instance_id) {
        parent::__construct($mod_name, $mod_instance_id);
        $this->require_login();
    } // function __construct


} // class answer_controller 
