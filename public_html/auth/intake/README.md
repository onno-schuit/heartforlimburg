
Voucher based self registration plugin
--------------------------------------

Version: 0.01 - 30.10.2012

--------------------------------------

Module is almost stand-alone, and can be easily ported to any moodle 2.3.2+

Main module logic is laying in [auth.php][auth_php] file inside [intake module directory][module_dir].
  [auth_php]: /onno-schuit/topsdemo/tree/master/public_html/auth/intakeauth.php
  [module_dir]: /onno-schuit/topsdemo/tree/master/public_html/auth/intake

Main configuration screen
-------------------------

Main configuration screen is produced by 'config_form' method of 'auth_plugin_intake', which is standard moodle way.
This method will render(basically just include html with php code) 'config.html' file.

After saving any changes on this or other plugin related pages method 'process_config' will be called.
Configuration processing is split into few steps:
 - Create new voucher
 - Update existing voucher
 - Delete existing voucher

For each of these steps plugin class has special methods new_voucher, update_voucher and delete voucher.
There are also special methods to determinate which method should be called (_is_new, _is_update and _is_delete).

Create new voucher
------------------

Create new voucher screen is represented by 'new_voucher_form' class inside [forms.php][forms_php] and [new.html][new_html] php/html file.
This is standard moodle form.
  [forms_php]: /onno-schuit/topsdemo/tree/master/public_html/auth/intake/forms.php
  [new_html]: /onno-schuit/topsdemo/tree/master/public_html/auth/intake/new.html

new.html file includes [footer.html][footer_html] php/html file which represents courses selector.

Edit existing voucher
---------------------

Same as new voucher, has special moodle form inside [forms.php][forms_php] and separate template [edit.html][edit_html] php/html file.
  [edit_html]: /onno-schuit/topsdemo/tree/master/public_html/auth/intake/edit.html

User registration screen
------------------------

User registration screen modifications are located inside following files:

- /login/signup.php lines [46:82]

      // Start of auth intake code
      // Check if Intake auth plugin is used
      if ($authplugin->authtype == 'intake') {
          $status = true;
          if (!isset($_POST['vouchercode'])) {
              $status = false;
          }

          $voucher = $DB->get_record('auth_intake_vouchers', array('code' => $_POST['vouchercode']));
          if (!$voucher) {
              $status = false;
          }

          // Voucher is still valid
          if ($status && (int)$voucher->count !== 0) {
              if ($voucher->count - $voucher->used < 1) {
                  $status = false;
              }
          }

          $now = time();
          if ($status && $voucher->active_from && $voucher->active_from > 0) {
              if ($now < $voucher->active_from) {
                  $status = false;
              }
          }

          if ($status && $voucher->active_till && $voucher->active_till > 0) {
              if ($now > $voucher->active_till) {
                  $status = false;
              }
          }
          
          if (!$status) {
              // TODO: replace standard error page with something more human-readable
              print_error('auth_intake_invalid_vouchercode', 'auth_intake');
          }
      }
      // End of auth intake code



- /login/signup_form.php lines [38:42]

        // Auth Intake related
        if ($CFG->registerauth == 'intake' && isset($_POST['vouchercode'])) {
            $mform->addElement('hidden', 'vouchercode', $_POST['vouchercode']);
        }


- /login/index_form.html lines [95:113]

      <!-- code for auth intake -->
      <?php     } else if ($CFG->registerauth == 'intake') { // Intake signup
                    if (!empty($CFG->auth_instructions)) {
                        echo format_text($CFG->auth_instructions);
                    } else {
                        print_string("auth_intake_loginsteps", "auth_intake");
                    } ?>
      <div class="sigupform">
        <form action="signup.php" method="post" id="signup">
          <table>
            <tr>
        <td><label for="vouchercode" id="id_vouchercode"><?php print_string("auth_intake_my_vouchercode", "auth_intake"); ?>:</label></td>
        <td><input type="text" name="vouchercode" id="vouchercode" value="" /></td>
            </tr>
            <tr>
        <td>&nbsp;</td>
        <td><input type="submit" value="<?php print_string("startsignup") ?>" /></td>
            </tr>
          </table>
        </form>
      <!-- end of code for auth intake -->

User registration process is finished inside /public_html/auth/intake/auth.php by 'user_signup' method of plugin class.
Please see lines 87:103 for futher details. During registration process 'validate_voucher' method will be called in order to validate voucher and check if it is not overused and still valid.
