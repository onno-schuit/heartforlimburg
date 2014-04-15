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
 * user signup page.
 *
 * @package    core
 * @subpackage auth
 * @copyright  1999 onwards Martin Dougiamas  http://dougiamas.com
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

require('../config.php');
require_once($CFG->dirroot . '/user/editlib.php');

// Try to prevent searching for sites that allow sign-up.
if (!isset($CFG->additionalhtmlhead)) {
    $CFG->additionalhtmlhead = '';
}
$CFG->additionalhtmlhead .= '<meta name="robots" content="noindex" />';

if (empty($CFG->registerauth)) {
    print_error('notlocalisederrormessage', 'error', '', 'Sorry, you may not use this page.');
}
$authplugin = get_auth_plugin($CFG->registerauth);

if (!$authplugin->can_signup()) {
    print_error('notlocalisederrormessage', 'error', '', 'Sorry, you may not use this page.');
}

//HTTPS is required in this page when $CFG->loginhttps enabled
$PAGE->https_required();

$PAGE->set_url('/login/signup.php');
$PAGE->set_context(context_system::instance());

// Check if Intake auth plugin is used
if ($authplugin->authtype == 'intake') {
    $status = true;
    if (!isset($_POST['vouchercode'])) {
        $status = false;
    }

    $voucher = $DB->get_record('auth_intake_vouchers', array('code' => $_POST['vouchercode']));
    if (!$voucher) {
        $status = false;
    }

    // Voucher is still valid
    if ($status && (int)$voucher->count !== 0) {
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
    
    if (!$status) {
        // TODO: replace standard error page with something more human-readable
        print_error('auth_intake_invalid_vouchercode', 'auth_intake');
    }
}

//$mform_signup = new login_signup_form(null, null, 'post', '', array('autocomplete'=>'on'));

//TODO:most of chanches that HERE

$mform_signup = $authplugin->signup_form();

if ($mform_signup->is_cancelled()) {
    redirect(get_login_url());

} else if ($user = $mform_signup->get_data()) {
    $user->confirmed   = 0;
    $user->lang        = current_language();
    $user->firstaccess = time();
    $user->timecreated = time();
    $user->mnethostid  = $CFG->mnet_localhost_id;
    $user->secret      = random_string(15);
    $user->auth        = $CFG->registerauth;
    // Initialize alternate name fields to empty strings.
    $namefields = array_diff(get_all_user_name_fields(), useredit_get_required_name_fields());
    foreach ($namefields as $namefield) {
        $user->$namefield = '';
    }

    $authplugin->user_signup($user, true); // prints notice and link to login/index.php
    exit; //never reached
}

// make sure we really are on the https page when https login required
$PAGE->verify_https_required();


$newaccount = get_string('newaccount');
$login      = get_string('login');

$PAGE->navbar->add($login);
$PAGE->navbar->add($newaccount);

$PAGE->set_title($newaccount);
$PAGE->set_heading($SITE->fullname);

echo $OUTPUT->header();
$mform_signup->display();
echo $OUTPUT->footer();
