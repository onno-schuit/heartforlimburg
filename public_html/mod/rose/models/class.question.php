<?php
namespace rose;

include_once("{$CFG->dirroot}/local/soda/class.model.php");

class question extends \model {
    static $table_name = 'rose_questions';


    static function load_with_answers($rose_id, $attempt_id, $user_id) {
        $class_name = get_class();
        return static::raw_load(
            "SELECT rq.id AS id, rq.rose_id, rq.rank, rq.dimension_id, rq.label, ra.id AS answer_id, ra.user_id, ra.value, ra.attempt_id
             FROM {rose_questions} AS rq 
             LEFT JOIN {rose_answers} AS ra ON rq.id = ra.question_id AND ra.attempt_id = :attempt_id AND ra.user_id = :user_id
             WHERE rq.rose_id = :rose_id AND rq.deleted = 0
             ORDER BY ra.id",
            function($recordset) {return question::convert_and_attach_answer($recordset);},
            array('attempt_id' => $attempt_id, 'rose_id' => $rose_id, 'user_id' => $user_id));
    } // function load_with_answers


    static function convert_and_attach_answer($recordset, $class_name = false) {
        $objects = array();
        foreach ($recordset as $record) {
            $properties = question::extract($record, array('id', 'rose_id', 'rank', 'dimension_id', 'label'));
            $question = new question($properties);
            if ($record->answer_id) {
                $answer_properties = array_merge(array('id' => $record->answer_id), answer::extract($record, array('user_id', 'value', 'attempt_id')));
                $answer = new answer($answer_properties);
                $question->answer = $answer;
            }
            $objects[] = $question;
        }
        return $objects;
    } // function convert_and_attach_answer 
} // class question 
