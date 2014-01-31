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
 * Strings for component 'auth_email', language 'en', branch 'MOODLE_20_STABLE'
 *
 * @package   auth_email
 * @copyright 1999 onwards Martin Dougiamas  {@link http://moodle.com}
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

$string['auth_intakedescription'] = '<p>Voucher-based self-registration enables a user to create their own account via a
\'Create new account\' button on the login page, if they have a voucher code. The user then receives an email
containing a secure link to a page where they can confirm their account.
Future logins just check the username and password against the stored values in the Moodle database.</p>
<p>The Moodle administrator can also select courses for a specific voucher. Users who self-register with this voucher
will be automatically enrolled to the associated courses.</p>
<p>Note: In addition to enabling the plugin, voucher-based self-registration must also be selected from the self
registration drop-down menu on the \'Manage authentication\' page.</p>';
$string['auth_intakenoemail'] = 'Tried to send you an email but failed!';
$string['auth_intakerecaptcha'] = 'Adds a visual/audio confirmation form element to the signup page for email
    self-registering users. This protects your site against spammers and contributes to a worthwhile cause.
    See http://www.google.com/recaptcha/learnmore for more details. <br /><em>PHP cURL extension is required.</em>';
$string['auth_intakerecaptcha_key'] = 'Enable reCAPTCHA element';
$string['auth_intakesettings'] = 'Settings';
$string['pluginname'] = 'Voucher-based self-registration';

$string['auth_intake_vouchercode_label'] = 'Voucher Code';
$string['auth_intake_vouchercode'] = 'Voucher Code';
$string['auth_intake_vouchers_label'] = 'Vouchers';
$string['auth_intake_vouchers_count'] = 'Max Users';
$string['auth_intake_vouchers_count_explanation'] = '(0 means no limit)';
$string['auth_intake_vouchers_used'] = 'In Use';
$string['auth_intake_voucher_courses'] = 'Courses';
$string['auth_intake_voucher_groups'] = 'Groups';
$string['auth_intake_voucher_date_from'] = 'Active From';
$string['auth_intake_voucher_date_to'] = 'Active Till';
$string['auth_intake_voucher_use_courses'] = 'Enroll users into';
$string['auth_intake_voucher_other_courses'] = 'Do not enroll users into';

$string['auth_intake_loginsteps'] = 'Please fill in your voucher code here.';
$string['auth_intake_my_vouchercode'] = 'My voucher code';

$string['auth_intake_add'] = 'Add';
$string['auth_intake_remove'] = 'Remove';
$string['auth_intake_save'] = 'Save';
$string['auth_intake_done'] = 'Done';
$string['auth_intake_cancel'] = 'Cancel';
$string['auth_intake_use_dates'] = 'Use dates';

// Error messages
$string['auth_intake_invalid_vouchercode'] = 'Sorry, your voucher is not valid.';
$string['auth_intake_voucher_exists'] = 'A voucher with this code already exists';
$string['auth_intake_voucher_too_long'] = 'The voucher code is too long. 25 Characters is the maximum.';

// New voucher form
$string['auth_intake_new_voucher'] = 'New voucher';
$string['auth_intake_new_voucher_submit'] = 'Create new voucher';
$string['auth_intake_new_voucher_exists'] = 'Voucher with this code already exists';

// Edit voucher form
$string['auth_intake_edit_voucher'] = 'Update';
$string['auth_intake_edit_voucher_submit'] = 'Update voucher';

// Delete voucher form
$string['auth_intake_delete_voucher'] = 'Delete';
$string['auth_intake_delete_voucher_submit'] = 'Yes, delete the voucher';
$string['auth_intake_delete_voucher_confirmation'] = 'Do you really want to delete the voucher?';

// Create voucher
$string['auth_intake_created'] = 'New voucher has been created';
