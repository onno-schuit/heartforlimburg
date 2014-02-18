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

defined('MOODLE_INTERNAL') || die();

require_once($CFG->dirroot . '/mod/rose/backup/moodle2/restore_rose_stepslib.php'); // Because it exists (must)

/**
 * rose restore task that provides all the settings and steps to perform one
 * complete restore of the activity
 */
class restore_rose_activity_task extends restore_activity_task {

    /**
     * Define (add) particular settings this activity can have
     */
    protected function define_my_settings() {
        // No particular settings for this activity
    }

    /**
     * Define (add) particular steps this activity can have
     */
    protected function define_my_steps() {
        // Rose only has one structure step
        $this->add_step(new restore_rose_activity_structure_step('rose_structure', 'rose.xml'));
    }

    /**
     * Define the contents in the activity that must be
     * processed by the link decoder
     */
    /*
    static public function define_decode_contents() {
        $contents = array();

        $contents[] = new restore_decode_content('rose', array('intro'), 'rose');

        return $contents;
    }
     */

    /**
     * Define the decoding rules for links belonging
     * to the activity to be executed by the link decoder
     */
    /*
    static public function define_decode_rules() {
        $rules = array();

        $rules[] = new restore_decode_rule('ROSEVIEWBYID', '/mod/rose/view.php?id=$1', 'course_module');
        $rules[] = new restore_decode_rule('ROSEINDEX', '/mod/rose/index.php?id=$1', 'course');

        return $rules;

    }
     */

    /**
     * Define the restore log rules that will be applied
     * by the {@link restore_logs_processor} when restoring
     * rose logs. It must return one array
     * of {@link restore_log_rule} objects
     */
    /*
    static public function define_restore_log_rules() {
        $rules = array();

        $rules[] = new restore_log_rule('rose', 'add', 'view.php?id={course_module}', '{rose}');
        $rules[] = new restore_log_rule('rose', 'update', 'view.php?id={course_module}', '{rose}');
        $rules[] = new restore_log_rule('rose', 'view', 'view.php?id={course_module}', '{rose}');
        $rules[] = new restore_log_rule('rose', 'choose', 'view.php?id={course_module}', '{rose}');
        $rules[] = new restore_log_rule('rose', 'choose again', 'view.php?id={course_module}', '{rose}');
        $rules[] = new restore_log_rule('rose', 'report', 'report.php?id={course_module}', '{rose}');

        return $rules;
    }
     */

    /**
     * Define the restore log rules that will be applied
     * by the {@link restore_logs_processor} when restoring
     * course logs. It must return one array
     * of {@link restore_log_rule} objects
     *
     * Note this rules are applied when restoring course logs
     * by the restore final task, but are defined here at
     * activity level. All them are rules not linked to any module instance (cmid = 0)
     */
    /*
    static public function define_restore_log_rules_for_course() {
        $rules = array();

        // Fix old wrong uses (missing extension)
        $rules[] = new restore_log_rule('rose', 'view all', 'index?id={course}', null,
                                        null, null, 'index.php?id={course}');
        $rules[] = new restore_log_rule('rose', 'view all', 'index.php?id={course}', null);

        return $rules;
    }
     */
}
