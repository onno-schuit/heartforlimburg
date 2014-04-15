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
        $field = new xmldb_field('groups',XMLDB_TYPE_CHAR,'500',null,XMLDB_NOTNULL,null,null);
        if (!$dbman->field_exists($table, $field))
        {
            $dbman->add_field($table, $field);
        }
        upgrade_plugin_savepoint(true, 2014040402, 'auth', 'intake');
    }
    
    return true;
}