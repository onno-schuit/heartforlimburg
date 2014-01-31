<?php
 
class block_tutorial_edit_form extends block_edit_form {
 
    protected function specific_definition($mform) {
 
        // Section header title according to language file.
        $mform->addElement('header', 'configheader', get_string('form-where', 'block_tutorial'));
 


        $mform->addElement('text', 'config_top', get_string('top', 'block_tutorial'), array('size' => '4'));
        $mform->setDefault('config_top', '0');
        $mform->setType('config_top', PARAM_MULTILANG);        

        $mform->addElement('text', 'config_left', get_string('left', 'block_tutorial'), array('size' => '4'));
        $mform->setDefault('config_left', '0');
        $mform->setType('config_left', PARAM_MULTILANG);        

        $mform->addElement('text', 'config_height', get_string('height', 'block_tutorial'), array('size' => '4'));
        $mform->setDefault('config_height', '200');
        $mform->setType('config_height', PARAM_MULTILANG);        

        $mform->addElement('text', 'config_width', get_string('width', 'block_tutorial'), array('size' => '4'));
        $mform->setDefault('config_width', '450');
        $mform->setType('config_width', PARAM_MULTILANG);        


        $mform->addElement('header', 'when', get_string('form-when', 'block_tutorial'), null, false);

        $mform->addElement('text', 'config_hide_after_n_times', get_string('hide_after_n_times', 'block_tutorial'), array('size' => '4'));
        $mform->setDefault('config_hide_after_n_times', '');
        $mform->setType('config_hide_after_n_times', PARAM_MULTILANG);     


        $mform->addElement('text', 'config_capability', get_string('capability', 'block_tutorial'));
        $mform->setDefault('config_capability', '');
        $mform->setType('config_capability', PARAM_MULTILANG);     



        $radioarray=array();
        $radioarray[] =& $mform->createElement('radio', 'config_show_when', '', get_string('logged_in', 'block_tutorial'), 'logged_in');
        $radioarray[] =& $mform->createElement('radio', 'config_show_when', '', get_string('logged_out', 'block_tutorial'), 'logged_out');
        $radioarray[] =& $mform->createElement('radio', 'config_show_when', '', get_string('editing_page', 'block_tutorial'), 'editing_page');
        $mform->addGroup($radioarray, 'radioar', get_string('show_when', 'block_tutorial'), array(' '), false);
        $mform->setDefault('config_show_when', 'logged_in');


        $mform->addElement('html', '<div style="margin-top:15px;">' . get_string('rules_explanation', 'block_tutorial') .'</div>');

        $attributes = array('size' => '80');
        $mform->addElement('text', 'config_precondition', get_string('pre-condition', 'block_tutorial'), $attributes);
        $mform->setDefault('config_precondition', '');
        $mform->setType('config_precondition', PARAM_MULTILANG);   

        $attributes = array('size' => '80');
        $mform->addElement('text', 'config_postcondition', get_string('post-condition', 'block_tutorial'), $attributes);
        $mform->setDefault('config_postcondition', '');
        $mform->setType('config_postcondition', PARAM_MULTILANG);   
        /*
        $mform->addElement('text', 'config_rules_for_hiding', get_string('rules_for_hiding', 'block_tutorial'));
        $mform->setDefault('config_rules_for_hiding', '');
        $mform->setType('config_rules_for_hiding', PARAM_MULTILANG);     
         */

        $mform->addElement('header', 'what', get_string('form-what', 'block_tutorial'), null, false);


        $editoroptions = array('maxfiles' => EDITOR_UNLIMITED_FILES, 'noclean'=>true, 'context'=>$this->block->context);
        $mform->addElement('editor', 'config_guide', get_string('guide', 'block_tutorial'), null, $editoroptions);
        $mform->setType('config_guide', PARAM_RAW);

        /*
        $mform->addElement('advcheckbox',
            'config_show_alternative_text',
            get_string('on_logged_out', 'block_tutorial'),
            get_string('show_alternative_text', 'block_tutorial'),
            array('group' => 1),
            array(0, 1)
        );

         */

    } // function specific_definition

} // class block_tutorial_edit_form 
?>
