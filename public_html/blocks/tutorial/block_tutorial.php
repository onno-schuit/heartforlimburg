<?php

class block_tutorial extends block_base {

    static $added_style_tags = false;

    public function init() {
        $this->title = get_string('tutorial', 'block_tutorial');
    } // function init


    public function instance_allow_multiple() {
        return true;
    } // function instance_allow_multiple


    function hide_block() {
        if (! $this->user_in_target_audience()) return true;
        $this->delete_cookie_if_test();
        if ($this->hide_by_rules()) {
            return true;
        }
        $count = $this->get_view_count() + 1;
        if (! $this->in_test_mode()) {
            setcookie("tutorial_{$this->instance->id}", "{$count}", time() + (80 * 365 * 24 * 60 * 60));
        }
        return false;
    } // function hide_block


    function in_test_mode() {
        return (isset($_REQUEST) && array_key_exists('test_tutorial', $_REQUEST));    
    } // function in_test_mode


    function delete_cookie_if_test() {
        if ($this->in_test_mode())  {
            setcookie("tutorial_{$this->instance->id}", "", time()-3600);
        }
    } // function delete_cookie_if_test


    function get_view_count() {
        if (!isset($_COOKIE["tutorial_{$this->instance->id}"])) return 0;
        return (int) $_COOKIE["tutorial_{$this->instance->id}"];
    } // function get_view_count


    function hide_by_rules() {
        if ($this->tutorial_is_being_edited()) return false;

        if ($this->show_only_when_does_not_match()) return true;

        if (!$this->meets_precondition()) return true;
        if ($this->meets_postcondition()) return true;
        if ($this->max_displays_reached()) return true;
        return false;
    } // function hide_by_rules


    function show_only_when_does_not_match() {
        if ( (!isloggedin()) && ($this->config->show_when != 'logged_out') ) return true;
        if ($this->page->user_is_editing() &&  ($this->config->show_when != 'editing_page')) return true;
        if ((!$this->page->user_is_editing()) &&  isloggedin() && ($this->config->show_when != 'logged_in')) return true;
    } // function show_only_when_does_not_match


    function max_displays_reached() {
        if ( (!isset($this->config->hide_after_n_times)) || (trim($this->config->hide_after_n_times) == '') ) return false;
        if ($this->get_view_count() >= (int) $this->config->hide_after_n_times) return true;
        return false;
    } // function max_displays_reached


    function meets_precondition() {
        if ( (!isset($this->config->precondition)) || (trim($this->config->precondition) == '') ) return true;
        if (!isloggedin()) return true;
        return $this->evaluate_condition($this->config->precondition);
    } // function meets_precondition


    function meets_postcondition() {
        if ( (!isset($this->config->postcondition)) || (trim($this->config->postcondition) == '') ) return false;
        if (!isloggedin()) return false;
        return $this->evaluate_condition($this->config->postcondition);
    } // function meets_postcondition


    function evaluate_condition($condition) {
        global $DB, $USER;
        return $DB->get_record_select(
            'log',
            "$condition AND userid = {$USER->id}",
            null,
            '*',
            IGNORE_MULTIPLE 
        );
    } // function evaluate_condition


    // If this tutorial is explicitly meant for users with a specific capability,
    // check if the current user has that capability.
    function user_in_target_audience() {
        if ( isloggedin() && isset($this->config->capability) && (trim($this->config->capability) != '') ) {
            if ( !has_capability($this->config->capability, $this->page->context)) return false;
        }
        return true;
    } // function user_in_target_audience


    function get_content() {
        global $CFG;

        require_once($CFG->libdir . '/filelib.php');

        if ($this->content !== NULL) return $this->content;
        if ($this->hide_block()) return $this->content = '';

        $style = "";
        if ($this->hide_edit_buttons()) {
            $style = "<style>.trainertops-tutorial .commands {display:none;}</style>";
            self::$added_style_tags = true;
        }

        $this->content = new stdClass;
        $this->content->footer = '';
        $this->content->text = "{$style}<div class='tutorial-content'>{$this->get_tutorial_content()}</div>";

        return $this->content;
    } // function get_content() {


    function get_tutorial_content() {
        return (isset($this->config->guide) && isset($this->config->guide['text'])) ? $this->config->guide['text'] : get_string('change_me', 'block_tutorial');
    } // function get_tutorial_content


    function hide_edit_buttons() {
        global $USER;
        return ( (!self::$added_style_tags) && (!has_capability('block/tutorial:edit', $this->page->context)) );
    } // function hide_edit_buttons


    function hide_header() {
        return true;        
    } // function hide_header


    function tutorial_is_being_edited() {
        return ( $this->page->user_is_editing() && (has_capability('block/tutorial:edit', $this->page->context)) ); 
    } // function tutorial_is_being_edited


    function html_attributes() {
        global $USER;

        if ($this->hide_block()) return array('style' => 'display:none');

        $top = (isset($this->config->top)) ? $this->config->top : 0;
        $left = (isset($this->config->left)) ? $this->config->left : 0;
        $width = (isset($this->config->width)) ? $this->config->width : 200;
        $height = (isset($this->config->height)) ? $this->config->height : 100;

        $style = "z-index:1000;position:absolute;width:{$width}px;height:{$height}px;top:{$top}px;left:{$left}px;";
        if ($this->tutorial_is_being_edited()) {
            $style = "float:left;position:relative;width:{$width}px;height:{$height}px;";
        }

        // Default case: an id with the instance and a class with our name in it
        return array(
            'id' => 'inst'.$this->instance->id,
            'class' => 'block_'. $this->name(),
            'style' => $style
        );
    } // function html_attributes

} // class block_tutorial 
?>
