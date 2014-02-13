<?php

// FILENAME: lib.php
require_once("class.repeatcourse.php");
$repeatcourse_instance = new repeatcourse();

function repeatcourse_cron(){
    global $DB;
    $mailList = array();
    $curDateArr = getdate(time());
    
    $repCat = $DB->get_record('course_categories', array('name' => get_string('repcoursecategoryname', 'repeatcourse')), 'id');
error_log(get_string('repcoursecategoryname', 'repeatcourse'));
    $repCourses = $DB->get_records('courses', array('category' => $repCat->id), 'id, startdate');
    
    
    foreach($repCourses as $repcourse){
        $curInterval = $DB->get_record('repeatcourse_records', array('repeatcourse' => $repcourse->id), 'cinterval');
        $endDateArr = getdate($repcourse->startDate+($curInterval*86400));
        if($endDateArr['mday'] == $curDateArr['mday'] && $endDateArr['mon'] == $curDateArr['mon'] && $endDateArr['year'] == $curDateArr['year']){
            $mailList[] = $DB->get_records('repeatcourse_records', array('repeatcourse' => $repcourse->id), '*');//TODO:Here is should be USERS, not COURSES:(
        }
    }
    
}