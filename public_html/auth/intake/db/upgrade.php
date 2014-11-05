<?php

defined('MOODLE_INTERNAL') || die();

/**
 *
 * @global stdClass $CFG
 * @global moodle_database $DB
 * @param int $oldversion
 * @return bool
 */
function xmldb_auth_intake_upgrade($oldversion)
{
    global $CFG, $DB;

    $dbman = $DB->get_manager();

	if ($oldversion < 2014040402)
    {
        $table = new xmldb_table('auth_intake_vouchers');
        $field = new xmldb_field('groups',XMLDB_TYPE_CHAR,'500',null,XMLDB_NOTNULL,null,null, 'courses');
        if (!$dbman->field_exists($table, $field))
        {
            $dbman->add_field($table, $field);
        }
        upgrade_plugin_savepoint(true, 2014040402, 'auth', 'intake');
    }

    if ($oldversion < 2014110400) {

        // Define field role_id to be added to auth_intake_vouchers.
        $table = new xmldb_table('auth_intake_vouchers');
        $field = new xmldb_field('role_id', XMLDB_TYPE_INTEGER, '10', null, null, null, null, 'active_till');

        // Conditionally launch add field role_id.
        if (!$dbman->field_exists($table, $field)) {
            $dbman->add_field($table, $field);
        }

        // Define key role_id (foreign) to be added to auth_intake_vouchers.
        $key = new xmldb_key('role_id', XMLDB_KEY_FOREIGN, array('role_id'), 'role', array('id'));

        // Launch add key role_id.
        $dbman->add_key($table, $key);

        // Intake savepoint reached.
        upgrade_plugin_savepoint(true, 2014110400, 'auth', 'intake');
    }
	
    return true;
}