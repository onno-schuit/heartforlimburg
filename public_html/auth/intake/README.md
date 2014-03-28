
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
- /login/signup_form.php lines [38:42]
- /login/index_form.html lines [95:113]

User registration process is finished inside /public_html/auth/intake/auth.php by 'user_signup' method of plugin class.
Please see lines 87:103 for futher details. During registration process 'validate_voucher' method will be called in order to validate voucher and check if it is not overused and still valid.