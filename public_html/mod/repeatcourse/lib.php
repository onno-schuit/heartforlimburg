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
	        if(($endDateArr['mday'] == $curDateArr['mday'] && $endDateArr['mon'] == $curDateArr['mon'] && $endDateArr['year'] == $curDateArr['year']) || 1==1){
	            $curCourseUsers = $DB->get_records('course_completions', array('course' => $repcourse->id), 'userid');//here should be at least one record about successfull course-complteion
	            foreach($curCourseUsers as $ccu){
	            	$mailTo = $DB->get_record('user', array('id' => $ccu->userid), '*');
	            	$from = 'info@'.ltrim($_SERVER['SERVER_NAME'], 'www.');

	            	$subject = $mailTo->firstname . ', the course you\'ve passed is available again now!';
	            	$messagetext = 'Dear '.$mailTo->firstname . ' ' . $mailTo->lastname.',<br/>
	            		The course <strong>' . $repcourse->fullname . '</strong> you\'ve passed is available to be passed again now!<br/>
						Best regards, HeartforLimburg team.';
	            	email_to_user($mailTo, $from, $subject, $messagetext);
	            	return true;
	            }
	        }
    	}
    }
}