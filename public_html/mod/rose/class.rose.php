<?php
/////////////////////////////////////////////////////////////////////////////
//                                                                         //
// NOTICE OF COPYRIGHT                                                     //
//                                                                         //
// Rose - Personality Circumplex Module for Moode                          //
// For TrainerTops.com / TrainerTops.nl                                    //
//                                                                         //
// Copyright (C) 2013 Solin - www.solin.eu                                 //
//                                                                         //
//                                                                         //
// Programming and development:                                            //
//     Onno Schuit (o.schuit[atoraround]solin.nl)                          //
//                                                                         //
// For bugs, suggestions, etc. contact:                                    //
//     Onno Schuit (o.schuit[atoraround]solin.nl)                          //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////

// FILENAME: mod/rose/class.rose.php
include_once("{$CFG->dirroot}/local/soda/class.soda.php");

class rose extends soda {

    static function supports($feature) {
        switch($feature) {
            case FEATURE_BACKUP_MOODLE2:          return true;
            /*
            case FEATURE_MOD_ARCHETYPE:           return MOD_ARCHETYPE_RESOURCE;
            case FEATURE_GROUPS:                  return false;
            case FEATURE_GROUPINGS:               return false;
            case FEATURE_GROUPMEMBERSONLY:        return true;
            case FEATURE_MOD_INTRO:               return true;
            case FEATURE_COMPLETION_TRACKS_VIEWS: return true;
            case FEATURE_GRADE_HAS_GRADE:         return false;
            case FEATURE_GRADE_OUTCOMES:          return false;
            case FEATURE_SHOW_DESCRIPTION:        return true;
            */
            default: return null;
        }
    } // function supports

} // class rose 

?>
