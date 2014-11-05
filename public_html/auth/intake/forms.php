<?php
class new_voucher_form extends moodleform {
    function definition() {
        global $USER, $CFG, $DB;
        /*$mform = */$mform =& $this->_form;
        $mform->addElement('hidden', 'action', 'new');
        $mform->addElement('hidden', 'auth', 'intake');

        $mform->addElement('text', 'code', get_string('auth_intake_vouchercode', 'auth_intake'));
        $mform->addHelpButton('code', 'auth_intake_vouchercode', 'auth_intake');
		if (isset($this->_customdata->code)) {
            $mform->setDefault('code', $this->_customdata->code);
        }

        $mform->addElement('text', 'count', get_string('auth_intake_vouchers_count', 'auth_intake'));
        $mform->addHelpButton('count', 'auth_intake_vouchers_count', 'auth_intake');
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
		
		// Roles
		$roles_db = $DB->get_records('role', null, null, 'id, shortname');
		foreach ($roles_db as $role)
		{
			$roles[$role->id] = $role->shortname;
		}
		$select = $mform->addElement('select', 'role_id', get_string('auth_intake_role', 'auth_intake'), $roles);
        if (isset($this->_customdata['role_id']))	$mform->setDefault('role_id', $this->_customdata['role_id']);
		else										$mform->setDefault('role_id', $DB->get_field('role', 'id', array('shortname' => 'student')));
        $mform->setType('role_id', PARAM_RAW);

		//$mform->addElement('submit', 'submitbutton', get_string('auth_intake_new_voucher', 'auth_intake'));

        $mform->setType('action', PARAM_TEXT);
        $mform->setType('auth', PARAM_TEXT);
        $mform->setType('code', PARAM_TEXT);
        $mform->setType('count', PARAM_TEXT);
        $mform->setType('used', PARAM_TEXT);
        $mform->setType('date_from', PARAM_TEXT);
        $mform->setType('date_to', PARAM_TEXT);
        $mform->setType('use_dates', PARAM_BOOL);
        $mform->setType('courses', PARAM_TEXT);
        $mform->setType('groups', PARAM_TEXT);
        $mform->setType('submitbutton', PARAM_TEXT);
    }
} 

class edit_voucher_form extends moodleform {
    function definition() {
        global $USER, $CFG, $DB;
        /*$mform =*/ $mform =& $this->_form;
        $mform->addElement('hidden', 'action', 'edit');
        $mform->addElement('hidden', 'auth', 'intake');
        $mform->addElement('hidden', 'id', $this->_customdata['id']);
        $mform->addElement('text', 'code', get_string('auth_intake_vouchercode', 'auth_intake'));
        $mform->setDefault('code', $this->_customdata['code']);
        $mform->addElement('text', 'count', get_string('auth_intake_vouchers_count', 'auth_intake'));
        $mform->addHelpButton('count', 'auth_intake_vouchers_count', 'auth_intake');
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
//        $mform->addElement('select', 'courses', $this->_customdata['courses'], array('id'=>'courses'));
//file_put_contents('text.txt', print_r($this->_customdata['courses'], true));
        //$courses = $DB->get_records_sql('SELECT id, name FROM {auth_intake_vouchers} WHERE id = :cus_id', array('cus_id' => $this->_customdata['courses']));

        /*$bindedCrs = $DB->get_record('auth_intake_vouchers', array('code' => required_param('code', PARAM_TEXT)));
        $courses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE 1');
        //$courses = $DB->get_records_sql('SELECT id, fullname FROM {course} WHERE id NOT IN ('.$notAvCrs->courses.')');
file_put_contents('error_log', print_r($courses, true));
        $availCourses = array();
        foreach($courses as $crs){
            $availCourses[$crs->id] = $crs->fullname;
        }
        $mform->addElement('select', 'courses', get_string('auth_intake_voucher_courses', 'auth_intake'), $availCourses, array('multiple'=>'true', 'size'=>'6'));*/

        // Courses data added using javascript
        $mform->addElement('hidden', 'courses', $this->_customdata['courses'], array('id'=>'courses'));
        $mform->addElement('hidden', 'groups', @$this->_customdata['groups'], array('id'=>'groups'));

		// Roles
		$roles_db = $DB->get_records('role', null, null, 'id, shortname');
		foreach ($roles_db as $role)
		{
			$roles[$role->id] = $role->shortname;
		}
		$select = $mform->addElement('select', 'role_id', get_string('auth_intake_role', 'auth_intake'), $roles);
        if (isset($this->_customdata['role_id']))	$mform->setDefault('role_id', $this->_customdata['role_id']);
		else										$mform->setDefault('role_id', $DB->get_field('role', 'id', array('shortname' => 'student')));
        $mform->setType('role_id', PARAM_RAW);

		//$mform->addElement('submit', 'submitbutton', get_string('auth_intake_edit_voucher_submit', 'auth_intake'));

        $mform->setType('action', PARAM_TEXT);
        $mform->setType('auth', PARAM_TEXT);
        $mform->setType('id', PARAM_INT);
        $mform->setType('code', PARAM_TEXT);
        $mform->setType('count', PARAM_TEXT);
        $mform->setType('used', PARAM_TEXT);
        $mform->setType('date_from', PARAM_TEXT);
        $mform->setType('date_to', PARAM_TEXT);
        $mform->setType('use_dates', PARAM_BOOL);
        $mform->setType('courses', PARAM_TEXT);
        $mform->setType('groups', PARAM_TEXT);
        $mform->setType('submitbutton', PARAM_TEXT);
    }
} 
