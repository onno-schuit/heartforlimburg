<?php
namespace rose;

include_once("{$CFG->dirroot}/local/soda/class.model.php");

class dimension extends \model {
    static $table_name = 'rose_dimensions';

    function count_selected_answers($answers) {
        $selected_answers = \rose\answer::find_all_by_dimension_id_and_value($this->id, 1, $answers);        
        return (count($selected_answers));
    } // function count_selected_answers
} // class dimension 
