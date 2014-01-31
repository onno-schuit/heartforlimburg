<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Authentication Plugin: intake Authentication
 *
 * @author Martin Dougiamas
 * @license http://www.gnu.org/copyleft/gpl.html GNU Public License
 * @package auth_intake
 */

defined('MOODLE_INTERNAL') || die();

require_once($CFG->libdir.'/authlib.php');
require_once($CFG->libdir.'/formslib.php');
require_once($CFG->dirroot."/enrol/locallib.php");
require_once('forms.php');
/**
 * intake authentication plugin.
 */
class auth_plugin_intake extends auth_plugin_base {

    /**
     * Constructor.
     */
    function auth_plugin_intake() {
        $this->authtype = 'intake';
        $this->config = get_config('auth/intake');
        $this->table_name = 'auth_intake_vouchers';
    }

    /**
     * Returns true if the username and password work and false if they are
     * wrong or don't exist.
     *
     * @param string $username The username
     * @param string $password The password
     * @return bool Authentication success or failure.
     */
    function user_login ($username, $password) {
        global $CFG, $DB;
        if ($user = $DB->get_record('user', array('username'=>$username, 'mnethostid'=>$CFG->mnet_localhost_id))) {
            return validate_internal_user_password($user, $password);
        }
        return false;
    }

    /**
     * Updates the user's password.
     *
     * called when the user password is updated.
     *
     * @param  object  $user        User table object  (with system magic quotes)
     * @param  string  $newpassword Plaintext password (with system magic quotes)
     * @return boolean result
     *
     */
    function user_update_password($user, $newpassword) {
        $user = get_complete_user_data('id', $user->id);
        // This will also update the stored hash to the latest algorithm
        // if the existing hash is using an out-of-date algorithm (or the
        // legacy md5 algorithm).
        return update_internal_user_password($user, $newpassword);
    }

    /**
     * Enrolles given user into given course
     *
     * @param  object  $user        User table object  (with system magic quotes)
     * @param  int     $course_id   Course_id to enrol user in
     * @return boolean result
     */
    function actually_enroll_user($user, $course_id) {
        global $DB;

        $instance = $DB->get_record('enrol', array('enrol'=>'manual', 'courseid'=>$course_id));
        if ($instance == false) {
            $instance = new stdClass();
            $instance->enrol          = 'manual';
            $instance->status         = ENROL_INSTANCE_ENABLED;
            $instance->courseid       = $course_id;
            $instance->enrolstartdate = 0;
            $instance->enrolenddate   = 0;
            $instance->timemodified   = time();
            $instance->roleid         = 5; // STUDENT
            $instance->timecreated    = $instance->timemodified;
            $instance->sortorder      = $DB->get_field('enrol', 'COALESCE(MAX(sortorder), -1) + 1', array('courseid'=>$course_id));

            $instance = $DB->insert_record('enrol', $instance);
        }

        if (!$enrol = enrol_get_plugin('manual')) {
            return false;
        }
        $enrol->enrol_user($instance, $user->id, $instance->roleid, time(), 0);

        return true;
    }

    function can_signup() {
        return true;
    }

    /**
     * Sign up a new user ready for confirmation.
     * Password is passed in plaintext.
     *
     * @param object $user new user object
     * @param boolean $notify print notice with link and terminate
     */
    function user_signup($user, $notify=true) {
        global $CFG, $DB;
        require_once($CFG->dirroot.'/user/profile/lib.php');
        require_once($CFG->dirroot.'/user/lib.php');

        $user->password = hash_internal_user_password($user->password);

        // Get voucher code
        $voucher = $DB->get_record($this->table_name, array('code' => $user->vouchercode));
        if (!$this->validate_voucher($voucher)) {
            print_error('auth_intake_invalid_vouchercode', 'auth_intake');
        }

        // All goes well, increase voucher used info
        $voucher->used++;
        $DB->update_record($this->table_name, $voucher);

        $user->id = $DB->insert_record('user', $user);

        // Automatically enroll user to all courses
        foreach (explode(',', $voucher->courses) as $id) {
            $this->actually_enroll_user($user, $id);
        }

        // Save any custom profile field information.
        profile_save_data($user);

		$user = $DB->get_record('user', array('id'=>$user->id));
        events_trigger('user_created', $user);

        if (! send_confirmation_intake($user)) {
            //print_error('auth_intakenointake','auth_intake');
        }

        if ($notify) {
            global $CFG, $PAGE, $OUTPUT;
            $emailconfirm = get_string('emailconfirm');
            $PAGE->navbar->add($emailconfirm);
            $PAGE->set_title($emailconfirm);
            $PAGE->set_heading($PAGE->course->fullname);
            echo $OUTPUT->header();
            notice(get_string('emailconfirmsent', '', $user->email), "$CFG->wwwroot/index.php");
        } else {
            return true;
        }
    }

    /**
     * Returns true if plugin allows confirming of new users.
     *
     * @return bool
     */
    function can_confirm() {
        return true;
    }

    /**
     * Confirm the new user as registered.
     *
     * @param string $username
     * @param string $confirmsecret
     */
    function user_confirm($username, $confirmsecret) {
        global $DB;
        $user = get_complete_user_data('username', $username);

        if (!empty($user)) {
            if ($user->confirmed) {
                return AUTH_CONFIRM_ALREADY;

            } else if ($user->auth != $this->authtype) {
                return AUTH_CONFIRM_ERROR;

            } else if ($user->secret == $confirmsecret) {   // They have provided the secret key to get in
                $DB->set_field("user", "confirmed", 1, array("id"=>$user->id));
                if ($user->firstaccess == 0) {
                    $DB->set_field("user", "firstaccess", time(), array("id"=>$user->id));
                }
                return AUTH_CONFIRM_OK;
            }
        } else {
            return AUTH_CONFIRM_ERROR;
        }
    }

    function prevent_local_passwords() {
        return false;
    }

    /**
     * Returns true if this authentication plugin is 'internal'.
     *
     * @return bool
     */
    function is_internal() {
        return true;
    }

    /**
     * Returns true if this authentication plugin can change the user's
     * password.
     *
     * @return bool
     */
    function can_change_password() {
        return true;
    }

    /**
     * Returns the URL for changing the user's pw, or empty if the default can
     * be used.
     *
     * @return moodle_url
     */
    function change_password_url() {
        return null; // use default internal method
    }

    /**
     * Returns true if plugin allows resetting of internal password.
     *
     * @return bool
     */
    function can_reset_password() {
        return true;
    }

    /**
     * Returns true if plugin can be manually set.
     *
     * @return bool
     */
    function can_be_manually_set() {
        return true;
    }

    /**
     * Prints a form for configuring this authentication plugin.
     *
     * This function is called from admin/auth.php, and outputs a full page with
     * a form for configuring this plugin.
     *
     * @param array $page An object containing all the data for this page.
     */
    function config_form($config, $err, $user_fields) {
        global $DB;

        $result = false;
        $mode = false;
        if (isset($this->result)) {
            $result = $this->result;
            $mode = $this->mode;
        }

        $vouchers = $DB->get_records($this->table_name);

        $_cache_courses = array();
        foreach ($vouchers as $voucher) {
            $_courses = array();
            if (!empty($voucher->courses)) {
                foreach (explode(',', $voucher->courses) as $id) {
                    if (empty($_cache_courses[$id])) {
                        $_cache_courses[$id] = $DB->get_record('course', array('id'=>$id));
                    }
                    $_courses[] = $_cache_courses[$id];
                }
            }
            $voucher->courses = $_courses;
        }

        $form = Null;
        $view = 'config.html';
        $courses = $DB->get_records('course');

        // Skip this forms if main display should be shown
        if (!is_array($result) || !$result[0]) {
            if ($this->_is_new()) {
                $config->count = (isset($config->count) ? $config->count : 0);
                $config->used = (isset($config->used) ? $config->used : 0);
                $form = new new_voucher_form(null, $config);
                $view = 'new.html';
            }

            if ($this->_is_update()) {
                $voucher = $DB->get_record($this->table_name,
                    array('code' => $_REQUEST['code']));

                $data = array('code'      => $voucher->code,
                    'id'        => $voucher->id,
                    'used'      => isset($config->used) ? $config->used : $voucher->used,
                    'count'     => isset($config->count) ? $config->count : $voucher->count,
                    'courses'   => isset($config->courses) ? $config->courses : $voucher->courses,
                    'use_dates' => (!is_null($voucher->active_from) && $voucher->active_from !== 0),
                    'date_from' => isset($config->active_from) ? $config->active_from : $voucher->active_from,
                    'date_to'   => isset($config->active_till) ? $config->active_till : $voucher->active_till);

                $data['date_from'] = array('year'  => date('Y', $data['date_from']),
                    'month' => date('m', $data['date_from']),
                    'day'   => date('d', $data['date_from']));

                $data['date_to'] = array('year'  => date('Y', $data['date_to']),
                    'month' => date('m', $data['date_to']),
                    'day'   => date('d', $data['date_to']));


                $form = new edit_voucher_form(null, $data);
                $view = 'edit.html';
            }
        }

        include $view;
    }

    /**
     * Processes and stores configuration data for this authentication plugin.
     */
    function process_config($config) {
        // set to defaults if undefined
        if (!isset($config->recaptcha)) {
            $config->recaptcha = false;
        }

        $result = false;
        // Update voucher if needed
        if ($this->_is_update($config)) {
            // Pass controll to update_voucher process
            $this->mode = 'edit_voucher';
            $this->result = $this->update_voucher($config);
            $result = $this->result[0];
        }

        // Create new voucher if needed
        if ($this->_is_new($config)) {
            // Pass controll to new_voucher process
            $this->mode = 'new_voucher';
            $this->result = $this->new_voucher($config);
            $result = $this->result[0];
        }

        // Delete voucher if needed
        if ($this->_is_delete($config)) {
            // Pass controll to delete_voucher process
            $this->mode = 'delete_voucher';
            $this->result = $this->delete_voucher($config);
            $result = $this->result[0];
        }

        // save settings
        if (isset($config->recaptcha)) {
            set_config('recaptcha', $config->recaptcha, 'auth/intake');
        }

        return !isset($this->result);
    }

    /**
     * Returns whether or not the captcha element is enabled, and the admin settings fulfil its requirements.
     * @return bool
     */
    function is_captcha_enabled() {
        global $CFG;
        return isset($CFG->recaptchapublickey) && isset($CFG->recaptchaprivatekey) && get_config("auth/{$this->authtype}", 'recaptcha');
    }

    /**
     * Check if voucher update process called
     * @param stdObj $config
     * @return bool
     */
    function _is_update() {
        return isset($_REQUEST['action']) && $_REQUEST['action'] == 'edit';
    }

    /**
     * Update voucher from config
     * @param stdObj $config
     * @return array(0=>bool, 1=>message)
     */
    function update_voucher($config) {
        global $DB;

        // Validate dates
        $config = $this->validate_dates($config);

        // Check if vouchercode is unique
        $voucher = $DB->get_record($this->table_name, array('code'=>$config->code));
        $voucher->code = $config->code;
        $voucher->count = $config->count;
        $voucher->courses = $config->courses;
        $voucher->active_from = $config->date_from;
        $voucher->active_till = $config->date_to;

        $DB->update_record($this->table_name, $voucher);

        return array(true, 'done');
    }

    /**
     * Check if new voucher process called
     * @param stdObj $config
     * @return bool
     */
    function _is_new() {
        return isset($_REQUEST['action']) && $_REQUEST['action'] == 'new';
    }

    /**
     * Create new voucher
     * @param stdObj $config
     * @return array(0=>bool, 1=>message)
     */
    function new_voucher($config) {
        global $DB;
        // If no code provided - arrange new
        if (!isset($config->code) || empty($config->code)) {
            $config->code = substr(str_shuffle(str_repeat('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789',5)),0,5);
        }

        // Set count to zero if nothing supplied
        if (!isset($config->count)) {
            $config->count = 0;
        }

        // Check if vouchercode is unique
        if ($DB->get_record($this->table_name, array('code'=>$config->code)) !== false){
            // Voucher with this code already exists
            return array(false, 'voucher_exists');
        }

        // Check if vouchercode is correct
        if (count($config->code) > 25) {
            return array(false, 'voucher_is_too_long');
        }

        $config = $this->validate_dates($config);

        $new_voucher = (object)array('code' => $config->code,
            'count' => $config->count,
            'courses' => $config->courses,
			'groups' => $config->groups,
            'active_from' => $config->date_from,
            'active_till' => $config->date_to,
            'used' => 0);
        $DB->insert_record($this->table_name, $new_voucher, false);

        return array(true, 'created');
    }

    /**
     * Check if delete voucher process called
     * @param stdObj $config
     * @return bool
     */
    function _is_delete($config) {
        return isset($config->delete_voucher) && $config->delete_voucher !== 0;
    }

    /**
     * Delete voucher
     * @param stdObj $config
     * @return array(0=>bool, 1=>message)
     */
    function delete_voucher($config) {
        global $DB;

        $DB->delete_records($this->table_name, array('code' => $config->delete_voucher));

        return array(true, 'done');
    }

    /**
     * Validate voucher
     * @param stdObj $voucher
     * @return bool
     */
    function validate_voucher($voucher) {
        $status = true;
        // Voucher is still valid
        if ((int)$voucher->count !== 0) {
            if ($voucher->count - $voucher->used < 1) {
                $status = false;
            }
        }

        $now = time();

        if ($status && $voucher->active_from && $voucher->active_from > 0) {
            if ($now < $voucher->active_from) {
                $status = false;
            }
        }

        if ($status && $voucher->active_till && $voucher->active_till > 0) {
            if ($now > $voucher->active_till) {
                $status = false;
            }
        }
        return $status;
    }

    /**
     * Validate dates
     * @param stdObj $config
     * @return stdObj $config
     */
    function validate_dates($config) {
        // Check if date range should be used
        if (isset($config->use_dates) && $config->use_dates) {
            // Normalize dates
            $config->date_from = mktime(0, 0, 0,
                $config->date_from['month'],
                $config->date_from['day'],
                $config->date_from['year']);

            $config->date_to = mktime(0, 0, 0,
                $config->date_to['month'],
                $config->date_to['day'],
                $config->date_to['year']);

        } else {
            $config->date_from = 0;
            $config->date_to = 0;
        }

        return $config;
    }


function enrol_user ($username, $course_id, $roleid = 5)
{
    global $CFG, $DB, $PAGE;

    $username = utf8_decode ($username);
    /* Create the user before if it is not created yet */
    $conditions = array ('username' => $username);
    $user = $DB->get_record('user',$conditions);
    if (!$user)
        $this->create_joomdle_user ($username);

    $user = $DB->get_record('user',$conditions);
    $conditions = array ('id' => $course_id);
    $course = $DB->get_record('course', $conditions);


    // First, check if user is already enroled but suspended, so we just need to enable it

    $conditions = array ('courseid' => $course_id, 'enrol' => 'manual');
    $enrol = $DB->get_record('enrol', $conditions);

    $conditions = array ('username' => $username);
    $user = $DB->get_record('user', $conditions);

    $conditions = array ('enrolid' => $enrol->id, 'userid' => $user->id);
    $ue = $DB->get_record('user_enrolments', $conditions);

    if ($ue)
    {
        // User already enroled but suspended. Just activate enrolment and return
        $ue->status = 0; //active
        $DB->update_record('user_enrolments', $ue);
        return 1;
    }


    if ($CFG->version >= 2011061700)
        $manager = new course_enrolment_manager($PAGE, $course);
    else
        $manager = new course_enrolment_manager($course);

    $instances = $manager->get_enrolment_instances();
    $plugins = $manager->get_enrolment_plugins();
    $enrolid = 1; //manual
//	$roleid = 5; //student

    $today = time();
    $today = make_timestamp(date('Y', $today), date('m', $today), date('d', $today), 0, 0, 0);
    $timestart = $today;
    $timeend = 0;

    $instance = $instances[$enrolid];

    foreach ($instances as $instance)
    {
        if ($instance->enrol == 'manual')
            break;
    }

//	return $instance->enrol;
//	$plugin = $plugins[$instance->enrol];
    $plugin = $plugins['manual'];
    var_dump($instances);

    if ( $instance->enrolperiod)
        $timeend   = $timestart + $instance->enrolperiod;
    $plugin->enrol_user($instance, $user->id, $roleid, $timestart, $timeend);

    return 1;
}

}


