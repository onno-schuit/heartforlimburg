
<?php

class new_voucher_form extends moodleform {
    function definition() {
        global $USER, $CFG;
        $mform = $mform =& $this->_form;
        $mform->addElement('hidden', 'action', 'new');
        $mform->addElement('hidden', 'auth', 'intake');

        $mform->addElement('text', 'code', get_string('auth_intake_vouchercode', 'auth_intake'));
        if (isset($this->_customdata->code)) {
            $mform->setDefault('code', $this->_customdata->code);
        }

        $mform->addElement('text', 'count', get_string('auth_intake_vouchers_count', 'auth_intake'));
        if (isset($this->_customdata->count)) {
            $mform->setDefault('count', $this->_customdata->count);
        }

        $mform->addElement('hidden', 'used', 0);

        $mform->addElement('date_selector', 'date_from', get_string('auth_intake_voucher_date_from', 'auth_intake'));
        if (isset($this->_customdata->date_from)) {
            $mform->setDefault('date_from', $this->_customdata->date_from);
        }

        $mform->addElement('date_selector', 'date_to', get_string('auth_intake_voucher_date_to', 'auth_intake'));
        if (isset($this->_customdata->date_to)) {
            $mform->setDefault('date_to', $this->_customdata->date_to);
        }

        $mform->addElement('checkbox', 'use_dates', get_string('auth_intake_use_dates', 'auth_intake'));
        if (isset($this->_customdata->use_dates)) {
            $mform->setDefault('use_dates', $this->_customdata['use_dates']);
        }

        // Courses data added using javascript
        $mform->addElement('hidden', 'courses', (isset($this->_customdata->courses) ? $this->_customdata->courses : ''), array('id'=>'courses'));
        $mform->addElement('hidden', 'groups', (isset($this->_customdata->groups) ? $this->_customdata->groups : ''), array('id'=>'groups'));

        $mform->addElement('submit', 'submitbutton', get_string('auth_intake_new_voucher', 'auth_intake'));
    }
} 

class edit_voucher_form extends moodleform {
    function definition() {
        global $USER, $CFG;
        $mform = $mform =& $this->_form;
        $mform->addElement('hidden', 'action', 'edit');
        $mform->addElement('hidden', 'auth', 'intake');
        $mform->addElement('hidden', 'id', $this->_customdata['id']);
        $mform->addElement('text', 'code', get_string('auth_intake_vouchercode', 'auth_intake'));
        $mform->setDefault('code', $this->_customdata['code']);
        $mform->addElement('text', 'count', get_string('auth_intake_vouchers_count', 'auth_intake') . ' ' .get_string('auth_intake_vouchers_count_explanation', 'auth_intake'));
        $mform->setDefault('count', $this->_customdata['count']);
        $mform->addElement('text', 'used', get_string('auth_intake_vouchers_used', 'auth_intake'));
        $mform->setDefault('used', $this->_customdata['used']);

        $mform->addElement('date_selector', 'date_from', get_string('auth_intake_voucher_date_from', 'auth_intake'));
        $mform->setDefault('date_from', $this->_customdata['date_from']);

        $mform->addElement('date_selector', 'date_to', get_string('auth_intake_voucher_date_to', 'auth_intake'));
        $mform->setDefault('date_to', $this->_customdata['date_to']);

        $mform->addElement('checkbox', 'use_dates', get_string('auth_intake_use_dates', 'auth_intake'));
        $mform->setDefault('use_dates', $this->_customdata['use_dates']);

        // Courses data added using javascript
        $mform->addElement('hidden', 'courses', $this->_customdata['courses'], array('id'=>'courses'));
        $mform->addElement('hidden', 'groups', $this->_customdata['groups'], array('id'=>'groups'));

        $mform->addElement('submit', 'submitbutton', get_string('auth_intake_edit_voucher_submit', 'auth_intake'));
    }
} 
