<?php

defined('MOODLE_INTERNAL') || die();

require_once($CFG->dirroot . '/mod/repeatcourse/lib.php');

$reports = core_component::get_plugin_list_with_file('repeatcourse', 'settings.php', false);

$rules = core_component::get_plugin_list_with_file('repeatcourseaccess', 'settings.php', false);
$rulesbyname = array();
foreach ($rules as $rule => $ruledir) {
    $strrulename = get_string('pluginname', 'repeatcourseccess_' . $rule);
    $rulesbyname[$strrulename] = $rule;
}
core_collator::ksort($rulesbyname);

// Create the quiz settings page.
if (empty($rulesbyname)) {
    $pagetitle = get_string('modulename', 'repeatcourse');
} else {
    $pagetitle = get_string('generalsettings', 'admin');
}
$repCourseSettings = new admin_settingpage('modsettingrepeatcourse', $pagetitle, 'moodle/site:config');

//$repCourseSettings->add(new admin_setting_heading('repeatcourseintro', '', get_string('configintro', 'repeatcourse')));

$repCourseSettings->add(new admin_setting_configtext_with_advanced('repeatcourse/daytoremind',
        get_string('daytoremindcount', 'repeatcourse'), get_string('configdaytoremindcount', 'repeatcourse'),
        array('value' => '0', 'adv' => false), PARAM_INT));

$ADMIN->add('modsettings', $repCourseSettings);

$settings = null;