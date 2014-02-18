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


defined('MOODLE_INTERNAL') || die;

require_once($CFG->dirroot . '/mod/rose/backup/moodle2/backup_rose_stepslib.php');

/**
 * Provides the steps to perform one complete backup of the Label instance
 */
class backup_rose_activity_task extends backup_activity_task {

    /**
     * No specific settings for this activity
     */
    protected function define_my_settings() {
    }

    /**
     * Defines a backup step to store the instance data in the rose.xml file
     */
    protected function define_my_steps() {
        $this->add_step(new backup_rose_activity_structure_step('rose_structure', 'rose.xml'));
    }

    /**
     * No content encoding needed for this activity
     *
     * @param string $content some HTML text that eventually contains URLs to the activity instance scripts
     * @return string the same content with no changes
     */
    static public function encode_content_links($content) {
        return $content;
    }
} // class backup_rose_activity_task 

