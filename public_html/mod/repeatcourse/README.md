Module repeatcourse

In order to let the module repeatcourse work correct, there were made some changes to the core of moodle
In completion/completion_completion.php some on [#177:#195] and completion/completion_criteria_completion.php on [#126:#144].
This will send an e-mail to the user with a link to set the notifications for the repeat courses.

Futhermore there has to be a category for the repeat courses. The name of the category is irrelevant, but the category id number has to be "repeatcourse".
If there is no category with repeatcourse as the category id number, the module will not work.
