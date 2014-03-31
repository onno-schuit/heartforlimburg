<?php

// FILENAME: lib.php
require_once("class.repeatcourse.php");
$repeatcourse_instance = new repeatcourse();

function repeatcourse_cron(){
    global $DB, $CFG;
    require_once($CFG->libdir.'/moodlelib.php');
    $mailList = array();
    $curDateArr = getdate(time());

    $repCat = $DB->get_record('course_categories', array('name' => get_string('repcoursecategoryname', 'repeatcourse')), 'id');
    $repCourses = $DB->get_records('course', array('category' => $repCat->id), 'id, fullname, startdate');
    
    
    foreach($repCourses as $repcourse){
        $cIntervals = $DB->get_records('repeatcourse_records', array('repeatcourse' => $repcourse->id), 'cinterval');
        foreach($cIntervals as $curInterval){
            $startDate = intval($repcourse->startdate) + (intval($curInterval->cinterval)*86400);
            $endDateArr = getdate($startDate);
            if(($endDateArr['mday'] == $curDateArr['mday'] && $endDateArr['mon'] == $curDateArr['mon'] && $endDateArr['year'] == $curDateArr['year'])){
                //$curCourseUsers = $DB->get_records('course_completions', array('course' => $repcourse->id), 'userid');//here should be at least one record about successfull course-complteion
                $curCourseUsers = $DB->get_records_sql('SELECT cc.userid FROM {course_completions} AS cc INNER JOIN {course_completions_repcourse} AS ccr ON cc.userid = ccr.userid WHERE ccr.maincourseid = cc.course AND cc.course=:repcourseid', array('repcourseid' => $repcourse->id));
                foreach($curCourseUsers as $ccu){
                    $mailTo = $DB->get_record('user', array('id' => $ccu->userid), '*');
                    $from = 'info@'.ltrim($_SERVER['SERVER_NAME'], 'www.');

                    $subject = sprintf(get_string('email_repeatcourses_today_subject', 'repeatcourse'), $mailTo->firstname);
                    $messagetext = sprintf(get_string('email_repeatcourses_today_text', 'repeatcourse'), $mailTo->firstname, $mailTo->lastname, $mailTo->fullname);
                    email_to_user($mailTo, $from, $subject, $messagetext);
                }
            }

            $startDateReminder = intval($repcourse->startdate) + ((intval($curInterval->cinterval) - intval(get_config('repeatcourse', 'daytoremind')))*86400);
            $endDateRemArr = getdate($startDateReminder);
            if(($endDateRemArr['mday'] == $curDateArr['mday'] && $endDateRemArr['mon'] == $curDateArr['mon'] && $endDateRemArr['year'] == $curDateArr['year'])){
                //$curCourseUsers = $DB->get_records('course_completions', array('course' => $repcourse->id), 'userid');
                $curCourseUsers = $DB->get_records_sql('SELECT cc.userid FROM {course_completions} AS cc INNER JOIN {course_completions_repcourse} AS ccr ON cc.userid = ccr.userid WHERE ccr.maincourseid = cc.course AND cc.course=:repcourseid', array('repcourseid' => $repcourse->id));
                foreach($curCourseUsers as $ccu){
                    $mailTo = $DB->get_record('user', array('id' => $ccu->userid), '*');
                    $from = 'info@'.ltrim($_SERVER['SERVER_NAME'], 'www.');
                    
                    $subject = sprintf(get_string('email_repeatcourses_reminder_subject', 'repeatcourse'), $mailTo->firstname);
                    $messagetext = sprintf(get_string('email_repeatcourses_reminder_text', 'repeatcourse'), $mailTo->firstname, $mailTo->lastname, $mailTo->fullname, date('d-m-Y', $startDateReminder));
                    email_to_user($mailTo, $from, $subject, $messagetext);
                }
            }
    	}
    }
    return true;
}