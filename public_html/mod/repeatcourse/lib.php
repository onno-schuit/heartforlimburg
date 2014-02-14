<?php

// FILENAME: lib.php
require_once("class.repeatcourse.php");
$repeatcourse_instance = new repeatcourse();

function repeatcourse_cron(){
    global $DB, $CFG;
    require_once("/lib/moodlelib.php");
    $mailList = array();
    $curDateArr = getdate(time());
    
    $repCat = $DB->get_record('course_categories', array('name' => get_string('repcoursecategoryname', 'repeatcourse')), 'id');
    $repCourses = $DB->get_records('courses', array('category' => $repCat->id), 'id, fullname, startdate');
    
    
    foreach($repCourses as $repcourse){
        $curInterval = $DB->get_record('repeatcourse_records', array('repeatcourse' => $repcourse->id), 'cinterval');
        $endDateArr = getdate($repcourse->startDate+($curInterval*86400));
        if($endDateArr['mday'] == $curDateArr['mday'] && $endDateArr['mon'] == $curDateArr['mon'] && $endDateArr['year'] == $curDateArr['year']){
            $curCourseUsers = $DB->get_records('course_completions', array('course' => $repcourse->id), 'userid');
            foreach($curCourseUsers as $ccu){
            	$mailTo = $DB->get_record('user', array('id' => $ccu->userid), 'email, firstname, lastname');
            	
            	$from = 'info@'.ltrim($_SERVER['SERVER_NAME'], 'www.');
            	$subject = $mailTo->firstname . ', the course you\'ve passed is available again now!';
            	$messagetext = 'Dear '.$mailTo->firstname . ' ' . $mailTo->lastname.',\n
            		The course ' . $repcourse->fullname . ' you\'ve passed is available to be passed again now!\n
					Best regards, HeartforLimburg team.';
            	email_to_user($mail->email, $from, $subject, $messagetext);
            }
        }
    }
}