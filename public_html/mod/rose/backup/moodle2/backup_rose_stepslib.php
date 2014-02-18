<?php
/////////////////////////////////////////////////////////////////////////////
//                                                                         //
// NOTICE OF COPYRIGHT                                                     //
//                                                                         //
// Rose - Personality Circumplex Module for Moode                          //
// For TrainerTops.com / TrainerTops.nl                                    //
//                                                                         //
// Copyright (C) 2013 Solin - www.solin.eu                                 //
//                                                                         //
//                                                                         //
// Programming and development:                                            //
//     Onno Schuit (o.schuit[atoraround]solin.nl)                          //
//                                                                         //
// For bugs, suggestions, etc. contact:                                    //
//     Onno Schuit (o.schuit[atoraround]solin.nl)                          //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////

/**
 * @package    mod
 * @subpackage rose
 * @copyright  2013 Solin - www.solin.eu
 * @license    Copyright (C) 2013 Solin - www.solin.eu
 */

/**
 * Define all the backup steps that will be used by the backup_la_activity_task
 */

/**
 * Define the complete rose structure for backup, with file and id annotations
 */
class backup_rose_activity_structure_step extends backup_activity_structure_step {

    protected function define_structure() {

        // To know if we are including userinfo
        $userinfo = $this->get_setting_value('userinfo');

        // Define each element separated
        $rose = new backup_nested_element('rose', array('id'),
            array('name', 'intro', 'introformat', 'timemodified', 'x_left_label', 'x_right_label', 'y_top_label', 'y_bottom_label'));

        // contained in rose tag
        $dimensions = new backup_nested_element('dimensions');
        $dimension = new backup_nested_element('dimension', array('id'), array('label', 'rank', 'deleted'));

        // contained in dimension tag
        $questions = new backup_nested_element('rose_questions');
        $question = new backup_nested_element('rose_question', array('id'), array('rank', 'label', 'deleted'));

        // contained in rose tag
        $attempts = new backup_nested_element('rose_attempts');
        $attempt = new backup_nested_element('rose_attempt', array('id'), array('user_id', 'date_started', 'date_completed', 'deleted'));

        // contained in attempt tag
        $answers = new backup_nested_element('rose_answers');
        $answer = new backup_nested_element('rose_answer', array('id', 'question_id', 'dimension_id'), array('user_id', 'value'));

        // Build the tree
        $rose->add_child($dimensions);
        $dimensions->add_child($dimension);

        $dimension->add_child($questions);
        $questions->add_child($question);

        $rose->add_child($attempts);
        $attempts->add_child($attempt);

        $attempt->add_child($answers);
        $answers->add_child($answer);


        // Define sources
        $rose->set_source_table('rose', array('id' => backup::VAR_ACTIVITYID));
        $dimension->set_source_table('rose_dimensions', array('rose_id' => backup::VAR_ACTIVITYID), 'id ASC');
        $question->set_source_table('rose_questions', array('rose_id' => backup::VAR_ACTIVITYID, 'dimension_id' => backup::VAR_PARENTID), 'id ASC');


        // All the rest of elements only happen if we are including user info
        if ($userinfo) {
            $attempt->set_source_table('rose_attempts', array('rose_id' => backup::VAR_ACTIVITYID));
            $answer->set_source_table('rose_answers', array('attempt_id' => backup::VAR_PARENTID));
        }

        // Define id annotations
        $attempt->annotate_ids('user', 'user_id');
        $answer->annotate_ids('user', 'user_id');

        // Return the root element (rose), wrapped into standard activity structure
        return $this->prepare_activity_structure($rose);
    } // function define_structure
} // class backup_rose_activity_structure_step 

