<?php

defined('MOODLE_INTERNAL') || die;

require_once ($CFG->dirroot.'/course/moodleform_mod.php');

class mod_rose_mod_form extends moodleform_mod {
    function definition() {
        global $CFG, $DB;
        $mform = $this->_form;

        $config = get_config('rose');

        //-------------------------------------------------------
        $mform->addElement('header', 'general', get_string('general', 'form'));
        $mform->addElement('text', 'name', get_string('name'), array('size'=>'48'));
        if (!empty($CFG->formatstringstriptags)) {
            $mform->setType('name', PARAM_TEXT);
        } else {
            $mform->setType('name', PARAM_CLEANHTML);
        }
        $mform->addRule('name', null, 'required', null, 'client');
        $this->add_intro_editor();

        $mform->addElement('text', 'x_left_label', get_string('x_left_label', 'rose'));
        $mform->setDefault('x_left_label', get_string('x_left_label_default', 'rose'));
        $mform->setType('x_left_label', PARAM_TEXT);

        $mform->addElement('text', 'x_right_label', get_string('x_right_label', 'rose'));
        $mform->setDefault('x_right_label', get_string('x_right_label_default', 'rose'));
        $mform->setType('x_right_label', PARAM_TEXT);

        $mform->addElement('text', 'y_top_label', get_string('y_top_label', 'rose'));
        $mform->setDefault('y_top_label', get_string('y_top_label_default', 'rose'));
        $mform->setType('y_top_label', PARAM_TEXT);

        $mform->addElement('text', 'y_bottom_label', get_string('y_bottom_label', 'rose'));
        $mform->setDefault('y_bottom_label', get_string('y_bottom_label_default', 'rose'));
        $mform->setType('y_bottom_label', PARAM_TEXT);
        
        //-------------------------------------------------------
        $this->standard_coursemodule_elements();


        //-------------------------------------------------------
        $this->add_action_buttons();
    }

}
?>
