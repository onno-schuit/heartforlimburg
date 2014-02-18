<?php
  // example contents for version.php
  defined('MOODLE_INTERNAL') || die();

  $module->version   = 2013093002;       // Added language strings and capabilities
  $module->requires  = 2011112900;       // Requires this Moodle version
  $module->component = 'mod_rose';       // Full name of the plugin (used for diagnostics)
  $module->cron      = 0;
?>
