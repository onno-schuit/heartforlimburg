<?php
    $string['repcoursecategoryname'] = 'Repeat Courses';
    $string['select_course'] = '- Select course -';
    $string['no_available_courses'] = 'No available repeatcourses';
    $string['add_course_text'] = 'Select refresher course';
    
    $string['repeatcourse'] = "repeatcourse";
    $string['modulename'] = "repeatcourse";
    $string['modulenameplural'] = 'repeatcourses';
    $string['modulename_help'] = 'Manage your repeatcourses';
    $string['newmodulefieldset'] = 'Custom example fieldset';
    $string['newmodulename'] = 'New repeatcourse';
    $string['newmodulename_help'] = 'Manage your repeatcourses';
    $string['newmodule'] = 'New repeatcourse';
    $string['pluginadministration'] = 'repeatcourses administration';
    $string['pluginname'] = 'repeatcourse plugin';
    $string['configintro'] = 'The values you set here define count of day before refresher courses starts';
    $string['daytoremindcount'] = 'Day to remind';
    $string['configdaytoremindcount'] = 'Day before sending reminder email about refresher courses start';

	$string['course'] = 'Course';
	$string['interval'] = 'Interval';
	$string['indays'] = '(in days)';
	$string['ordering'] = 'Ordening';

	$string['priorityup'] = 'Priority up';
	$string['prioritydown'] = 'Priority down';
	$string['day'] = 'day';
	$string['days'] = 'days';
	$string['remove'] = 'Remove';
	$string['intervaldays'] = 'Enter interval (in days)';
	$string['addcourse'] = 'Add course';

	$string['maincourse'] = 'Main Course';
	$string['refreshingcourse'] = 'Refreshing Courses';

	$string['edit'] = 'Edit';
	$string['removeall'] = 'Remove all';

	$string['standard_error'] = 'Something went wrong, please try again later.';

	$string['course_added'] = 'Succesfully added the course.';
	$string['course_deleted'] = 'Succesfully deleted the course.';
	$string['all_courses_deleted'] = 'Succesfully deleted all the courses.';
	$string['ordening_changed'] = 'Succesfully changed the ordening.';

	$string['configure_course'] = 'Configure repeatcourses for';
	$string['back_to_main'] = '<< Back';


/********************************* E-mails beginning ****************************/
	$string['email_repeatcourses_today_subject'] = 'Refresher course "{$a}" starts today!';
	$string['email_repeatcourses_today_text'] = '<table><tr><td><p>
                    	<strong> [ <span> Dear {$a->name}</span> ],</strong>
						<br/>Your refresher course <strong>"{$a->coursename}"</strong> is about to begin today. <br/>
                        <br /><br/><i>Best regards,
            			<br/>Heart for Limburg team.</i>
            		</p></td></tr></table>';

	$string['email_repeatcourses_reminder_subject'] = 'Refresher course "{$a}" will start shortly!';
	$string['email_repeatcourses_reminder_text'] = '<table><tr><td><p>
                    	<strong> [ <span> Dear {$a->name}</span> ],</strong>
            			<br/>Your refresher course <strong>"{$a->coursename}"</strong> is about to begin. The course will start on {$a->startdate}.
            			<br /><br/><i>Best regards,
            			<br/>Heart for Limburg team.</i>
            		</p></td></tr></table>';

	$string['email_course_completion_subject'] = 'Course "{$a}" completed succesfully';
	$string['email_course_completion_text'] = '<table>
				<tr><td><p><strong> [ <span>Dear {$a->name}</span> ],</strong>
				<br/>To subscribe to the refresher courses distribution, please click on <strong><a href="{$a->link}">this link</a>.</strong>.
				<br /><br/><i>Best regards,
				<br/>Heart for Limburg team.</i>
				</p></td></tr></table>';

/************************************ E-mails end ***************************/
