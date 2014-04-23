<?php
    $string['repcoursecategoryname'] = 'Opfris cursussen';
    $string['select_course'] = '- Selecteer cursus -';
    $string['no_available_courses'] = 'Geen opfris cursussen beschikbaar';
    $string['add_course_text'] = 'Selecteer opfris cursus';
    
    $string['repeatcourse'] = "Opfris cursus";
    $string['modulename'] = "Opfris cursussen";
    $string['modulenameplural'] = 'Opfris cursussen';
    $string['modulename_help'] = 'Beheer de opfris cursussen';
    $string['newmodulefieldset'] = 'Standaard voorbeeld veld';
    $string['newmodulename'] = 'Nieuwe opfris cursus';
    $string['newmodulename_help'] = 'Beheer de opfris cursussen';
    $string['newmodule'] = 'Nieuwe opfris cursus';
    $string['pluginadministration'] = 'Opfris cursus administratie';
    $string['pluginname'] = 'Opfris cursus plugin';
    $string['configintro'] = 'De waarde die hier gedefinieerd wordt telt de dagen voordat de opfris cursus start';
    $string['daytoremindcount'] = 'Dagen tot herinnering';
    $string['configdaytoremindcount'] = 'Dagen tot het versturen van een e-mail over de start van de opfris cursus';

	$string['course'] = 'Cursus';
	$string['interval'] = 'Periode';
	$string['indays'] = '(in dagen)';
	$string['ordering'] = 'Sortering';
	
	$string['priorityup'] = 'Prioriteit omhoog';
	$string['prioritydown'] = 'Prioriteit omlaag';
	$string['day'] = 'dag';
	$string['days'] = 'dagen';
	$string['remove'] = 'Verwijder';
	$string['intervaldays'] = 'Vul periode in (in dagen)';
	$string['addcourse'] = 'Voeg cursus toe';

	$string['maincourse'] = 'Hoofd cursus';
	$string['refreshingcourse'] = 'Opfris cursussen';

	$string['edit'] = 'Bewerk';
	$string['removeall'] = 'Verwijder alle';
	
	$string['standard_error'] = 'Er is iets mis gegaan. Probeert u het a.u.b. later opnieuw.';

	$string['course_added'] = 'De cursus is succesvol toegevoegd.';
	$string['course_deleted'] = 'De cursus is succesvol verwijderd.';
	$string['all_courses_deleted'] = 'Alle cursussen zijn succesvol verwijderd.';
	$string['ordening_changed'] = 'De volgorde is succesvol veranderd.';

	$string['configure_course'] = 'Configureer opfris cursussen voor';
	$string['back_to_main'] = '<< Terug';

	$string['optin_error'] = 'Verkeerde gegevens ingestuurd!';
	$string['optin_title'] = 'E-mail instellingen voor "{$a}" cursus';
	$string['optin_text'] = 'Ik wil graag e-mail notificaties ontvangen over de opfris cursussen van de cursus <strong>{$a}</strong>.';
	$string['save'] = 'Opslaan';


/********************************* E-mails beginning ****************************/
$string['email_repeatcourses_today_subject'] = 'Opfris cursus "{$a}" begint vandaag!';
$string['email_repeatcourses_today_text'] = 
'Beste {$a->name},

De opfris cursus "{$a->coursename}" gaat vandaag beginnen.

Met vriendelijke groet,
Het Heart for Limburg team';


$string['email_repeatcourses_reminder_subject'] = 'Opfris cursus "{$a}" begint binnenkort!';
$string['email_repeatcourses_reminder_text'] = 
'Beste {$a->name},

De opfris cursus "{$a->coursename}" gaat bijna beginnen. De cursus zal starten op {$a->startdate}.

Met vriendelijke groet,
Het Heart for Limburg team';


$string['email_course_completion_subject'] = 'Cursus "{$a}" succesvol afgerond';
$string['email_course_completion_text'] = 
'Beste {$a->name},

Om u in te schrijven voor de opfris cursus meldingen, klik op de volgende link: {$a->link}

Met vriendelijke groet,
Het Heart for Limburg team';

/************************************ E-mails end ***************************/
