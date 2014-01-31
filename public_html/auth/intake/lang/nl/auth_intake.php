<?php

// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Strings for component 'auth_email', language 'en', branch 'MOODLE_20_STABLE'
 *
 * @package   auth_email
 * @copyright 1999 onwards Martin Dougiamas  {@link http://moodle.com}
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

$string['auth_intakedescription'] = '<p>Met voucher-gebaseerde zelfregistratie kan een gebruiker zelf zijn account maken op de moodle site: 
op het moment dat de gebruiker zich aanmeldt en daarbij een nieuwe gebruikersnaam en wachtwoord kiest, wordt
er een bevestigingse-mail gestuurd naar het e-mailadres van de gebruiker. In deze e-mail staat een
veilige link naar een pagina waar de gebruiker zijn account kan bevestigen. 
Tijdens alle latere aanmeldingen worden de gebruikersnaam en het wachtwoord alleen maar vergeleken met de
bewaarde gebruikersgegevens in de Moodle database.</p>
<p>De Moodle beheerder kan ook cursussen kiezen voor een specifieke voucher. Gebruikers die zichzelf registreren met deze voucher
worden automatisch lid van de gekoppelde cursussen.</p>
<p>Merk op: naast het inschakelen van deze plugin, moet voucher-gebaseerde zelfregistratie ook geselecteerd worden in het
zelf registratie rolmenu op de \'Beheer authenticatie\'-pagina.</p>';
$string['auth_intakenoemail'] = 'Kon geen email met accountgegevens versturen!';
$string['auth_intakerecaptcha'] = 'Hiermee voeg je een visueel/auditief bevestigingsformulier toe aan de zelfregistratiepagina voor 
    e-mailgebaseerde authenticatie. Dit beschermt je site tegen spammers. Bovendien help je mee aan de digitalisering van oude 
    manuscripten door het gebruik van reCAPTCHA op je site. Zie http://www.google.com/recaptcha/learnmore voor meer details. 
<br /><em>PHP cURL extentie is vereist.</em>';
$string['auth_intakerecaptcha_key'] = 'reCAPTCHA-element inschakelen';
$string['auth_intakesettings'] = 'Instellingen';
$string['pluginname'] = 'Voucher-gebaseerde zelf-registratie';

$string['auth_intake_vouchercode_label'] = 'Voucher code';
$string['auth_intake_vouchercode'] = 'Voucher code';
$string['auth_intake_vouchers_label'] = 'Vouchers';
$string['auth_intake_vouchers_count'] = 'Max gebruikers';
$string['auth_intake_vouchers_count_explanation'] = '(0 betekent geen limiet)';
$string['auth_intake_vouchers_used'] = 'In gebruik';
$string['auth_intake_voucher_courses'] = 'Cursussen';
$string['auth_intake_voucher_groups'] = 'Gruupen';
$string['auth_intake_voucher_date_from'] = 'Actief van';
$string['auth_intake_voucher_date_to'] = 'Actief tot';
$string['auth_intake_voucher_use_courses'] = 'Maak gebruikers lid van';
$string['auth_intake_voucher_other_courses'] = 'Maak gebruikers geen lid van';

$string['auth_intake_loginsteps'] = 'Vul a.u.b. hier de voucher code in';
$string['auth_intake_my_vouchercode'] = 'Voucher code';

$string['auth_intake_add'] = 'Toevoegen';
$string['auth_intake_remove'] = 'Verwijderen';
$string['auth_intake_save'] = 'Bewaren';
$string['auth_intake_done'] = 'Klaar';
$string['auth_intake_cancel'] = 'Annuleren';
$string['auth_intake_use_dates'] = 'Gebruik data';

// Error messages
$string['auth_intake_invalid_vouchercode'] = 'Sorry, de voucher is niet geldig.';
$string['auth_intake_voucher_exists'] = 'Er bestaat al een voucher met die code';
$string['auth_intake_voucher_too_long'] = 'De voucher code is te lang. 25 Tekens is het maximum.';

// New voucher form
$string['auth_intake_new_voucher'] = 'Nieuw voucher';
$string['auth_intake_new_voucher_submit'] = 'Nieuw voucher aanmaken';
$string['auth_intake_new_voucher_exists'] = 'Voucher met die code bestaat al';

// Edit voucher form
$string['auth_intake_edit_voucher'] = 'Bijwerken';
$string['auth_intake_edit_voucher_submit'] = 'Voucher bijwerken';

// Delete voucher form
$string['auth_intake_delete_voucher'] = 'Verwijderen';
$string['auth_intake_delete_voucher_submit'] = 'Ja, verwijder de voucher';
$string['auth_intake_delete_voucher_confirmation'] = 'Wil je de voucher echt verwijderen?';

// Create voucher
$string['auth_intake_created'] = 'Nieuwe voucher is aangemaakt'; 
