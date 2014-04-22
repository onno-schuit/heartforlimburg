
Voucher based self registration plugin
--------------------------------------

[Information for developers][intake]
  [intake]: /onno-schuit/topsdemo/tree/master/public_html/auth/intake

Usage
-----

- Module administration
- Self registration

-----

Module administration
---------------------

Administration is available for administrators only for now.

In order to manage main settings and vouchers please goto:
 [Site administration][admin_main]->[Plugins][admin_plugins]->Authentication->[Voucher-based self registration][admin_voucher_main]
  [admin_main]: /admin/
  [admin_plugins]: /admin/plugins.php
  [admin_voucher_main]: /admin/auth_config.php?auth=intake

Main configuration page will show you the vouchers block.
Within vouchers block admin is able to do main CRUD(Create Read Update Delete) actions.

Creating new voucher:
--------------------

New voucher can be created by clicking on [New voucher][new_voucher] button.
New voucher screen contains following fields:
 * Voucher code
  Note: If you'll leave this field empty, plugin will generate random 5 digit code for you.
 * Count
  Note: If set to zero voucher may be re-used unlimited times
 * Active from, Active till date selectors and Use dates checkbox
  If checkbox is not checked, voucher will have no date restrictions
 * Courses selector
  In order to automatically enroll users after registration add courses into 'Enroll users' column (left). You can do this by selecting needed course in right select box and clicking 'Add' button. Do not forget to 'Save' voucher;

 *Click 'New voucher' button in order to save new voucher, or 'Cancel' to go back to main screen.*

Updating voucher
----------------
In order to update existing voucher, just click 'Update' button near voucher description on main page. This form introduces new field:
 * Used
  Indicates how many times voucher was used, can be updated.
 
 *Click 'Update voucher' button in order to update voucher information, or 'Cancel' to go back to main screen.*

Deleting voucher
----------------
Any voucher can be deleted using 'Delete' link near voucher information on main screen.
After clicking on 'Delete' button you'll see Voucher deleting confirmation popup, there you can confirm voucher deletion.

 *Click 'Yes, delete voucher' in order to delete voucher, or 'Cancel' to close popup.*