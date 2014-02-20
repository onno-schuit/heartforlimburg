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
 * Define all the restore steps that will be used by the restore_rose_activity_task
 */

/**
 * Structure step to restore one rose activity
 */
class restore_rose_activity_structure_step extends restore_activity_structure_step {

    protected function define_structure() {

        $paths = array();
        $userinfo = $this->get_setting_value('userinfo');

        $paths[] = new restore_path_element('rose', '/activity/rose');
        $paths[] = new restore_path_element('rose_dimension', '/activity/rose/dimensions/dimension');
        if ($userinfo) {
            //$paths[] = new restore_path_element('rose_answer', '/activity/rose/answers/answer');
        }

        // Return the paths wrapped into standard activity structure
        return $this->prepare_activity_structure($paths);
    } // function define_structure


    protected function process_rose($data) {
        global $DB;

        $data = (object)$data;
        $oldid = $data->id;
        $data->course = $this->get_courseid();

        $data->timeopen = $this->apply_date_offset($data->timeopen);
        $data->timeclose = $this->apply_date_offset($data->timeclose);
        $data->timemodified = $this->apply_date_offset($data->timemodified);

        // insert the rose record
        $newitemid = $DB->insert_record('rose', $data);
        // immediately after inserting "activity" record, call this
        $this->apply_activity_instance($newitemid);
    } // function process_rose


    protected function process_rose_dimension($data) {
        global $DB;

        $data = (object)$data;
        $oldid = $data->id;

        $data->rose_id = $this->get_new_parentid('rose');
        $data->timemodified = $this->apply_date_offset($data->timemodified);

        $newitemid = $DB->insert_record('rose_dimensions', $data);
        $this->set_mapping('rose_dimension', $oldid, $newitemid);
    }

    /*
    protected function process_rose_answer($data) {
        global $DB;

        $data = (object)$data;

        $data->rose_id = $this->get_new_parentid('rose');
        $data->dimensionid = $this->get_mappingid('rose_dimension', $data->dimensionid);
        $data->userid = $this->get_mappingid('user', $data->userid);
        $data->timemodified = $this->apply_date_offset($data->timemodified);

        $newitemid = $DB->insert_record('rose_answers', $data);
        // No need to save this mapping as far as nothing depend on it
        // (child paths, file areas nor links decoder)
    }
     */

    protected function after_execute() {
        // Add rose related files, no need to match by itemname (just internally handled context)
        //$this->add_related_files('mod_rose', 'intro', null);
    } // function after_execute
} // class restore_rose_activity_structure_step 
