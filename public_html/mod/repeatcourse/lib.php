<?php

// FILENAME: lib.php
require_once("class.repeatcourse.php");
$repeatcourse_instance = new repeatcourse();

function repeatcourse_cron(){
    global $DB, $CFG;
    require_once($CFG->libdir.'/moodlelib.php');
    $mailList = array();
    $curDateArr = getdate(time());

    //$repCat = $DB->get_record('course_categories', array('name' => get_string('repcoursecategoryname', 'repeatcourse')), 'id');
    $repCat = $DB->get_record('course_categories', array('idnumber' => 'repeatcourse'), 'id');
    $repCourses = $DB->get_records('course', array('category' => $repCat->id), 'id, fullname, startdate');
    
    foreach($repCourses as $repcourse){
        $repeatCourseRecords = $DB->get_records('repeatcourse_records', array('repeatcourse' => $repcourse->id));
        foreach($repeatCourseRecords as $repeatCourseRecord){

            $startDate = intval($repcourse->startdate) + (intval($repeatCourseRecord->cinterval)*86400);
            $endDateArr = getdate($startDate);

			if(($endDateArr['mday'] == $curDateArr['mday'] && $endDateArr['mon'] == $curDateArr['mon'] && $endDateArr['year'] == $curDateArr['year'])){
                //$curCourseUsers = $DB->get_records('course_completions', array('course' => $repcourse->id), 'userid');//here should be at least one record about successfull course-complteion
                $curCourseUsers = $DB->get_records_sql('SELECT cc.userid FROM {course_completions} AS cc INNER JOIN {course_completions_repcourse} AS ccr ON cc.userid = ccr.userid WHERE ccr.maincourseid = cc.course AND cc.course=' . $repeatCourseRecord->maincourseid . ' AND ccr.mailing = 1');
				
                foreach($curCourseUsers as $ccu){
                    $mailTo = $DB->get_record('user', array('id' => $ccu->userid), '*');
                    //$from = 'info@'.ltrim($_SERVER['SERVER_NAME'], 'www.');
					$supportuser = core_user::get_support_user();

					$subject = get_string('email_repeatcourses_today_subject', 'repeatcourse', $repcourse->fullname);
                    $messagetext = get_string('email_repeatcourses_today_text', 'repeatcourse', array("name" => $mailTo->firstname . " " . $mailTo->lastname, "coursename" => $repcourse->fullname));

					email_to_user($mailTo, $supportuser, $subject, $messagetext);
                }
            }

            $startDateReminder = intval($repcourse->startdate) + ((intval($repeatCourseRecord->cinterval) - intval(get_config('repeatcourse', 'daytoremind')))*86400);
            $startDateCourse = intval($repcourse->startdate) + (intval($repeatCourseRecord->cinterval)*86400);
            $endDateRemArr = getdate($startDateReminder);

			if(($endDateRemArr['mday'] == $curDateArr['mday'] && $endDateRemArr['mon'] == $curDateArr['mon'] && $endDateRemArr['year'] == $curDateArr['year'])){
                //$curCourseUsers = $DB->get_records('course_completions', array('course' => $repcourse->id), 'userid');
                $curCourseUsers = $DB->get_records_sql('SELECT cc.userid FROM {course_completions} AS cc INNER JOIN {course_completions_repcourse} AS ccr ON cc.userid = ccr.userid WHERE ccr.maincourseid = cc.course AND cc.course=' . $repeatCourseRecord->maincourseid . ' AND ccr.mailing = 1');

				foreach($curCourseUsers as $ccu){
                    $mailTo = $DB->get_record('user', array('id' => $ccu->userid), '*');
                    //$from = 'info@'.ltrim($_SERVER['SERVER_NAME'], 'www.');
					$supportuser = core_user::get_support_user();
                   
                    $subject = get_string('email_repeatcourses_reminder_subject', 'repeatcourse', $repcourse->fullname);
                    $messagetext = get_string('email_repeatcourses_reminder_text', 'repeatcourse', array("name" =>$mailTo->firstname . " " . $mailTo->lastname, "coursename" => $repcourse->fullname, "startdate" => date('d-m-Y', $startDateCourse)));

					email_to_user($mailTo, $supportuser, $subject, $messagetext);
				}
            }
    	}
    }
    return true;
}
