<?php
  // example contents for version.php
  defined('MOODLE_INTERNAL') || die();

  $module->version   = 2014032800; //2014021300;     // The current module version (Date: YYYYMMDDXX)
  $module->requires  = 2011112900;       // Requires this Moodle version
  $module->component = 'mod_repeatcourse';   // Full name of the plugin (used for diagnostics)
  $module->cron      = 86400; //Everyday mailing
