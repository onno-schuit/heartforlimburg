<?php

class attempt_helper extends helper {

    function print_checked_and_disabled($question, $value) {
        if (!property_exists($question, 'answer')) return "";
        if ($question->answer->value == $value) {
            return " checked='checked' disabled='disabled' ";
        }
        return " disabled='disabled' ";
    } // function print_checked_and_disabled

} // class attempt_helper 
