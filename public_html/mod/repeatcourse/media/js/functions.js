function add_rep_course() {
    var id = 8; /* Change this value to value from $_GET!!!*/
    var selected_course = $("#course_selector :selected").html();
console.log(selected_course);
    var data = "id="+id+"&coursename="+selected_course+"&interval="+$("#repcourse_interval").val()+"&action=add_repcourse";/*+"&ordering="+ordering;*/
    $.ajax({
        type: "POST",
        url: '/mod/repeatcourse/index.php',
        data: data,
        success: function(e, data){
            var table = $("#coursetable");
            var row = $("#coursetable tr").eq(1).clone().appendTo(table);
            row.children().eq(0).html();
            row.children().eq(1).html(selected_course);
            row.children().eq(3).html($("#repcourse_interval").val());
            $("#course_selector :selected").remove();
            if($("#course_selector").children().length == 0){
                $("#available_courses").hide();
            }
            $("#result_msg").html('<span class="msg_success" style="display: none;">Successfully saved<span>');
            $(".msg_success").fadeIn(500).fadeOut(2000).remove();
        },
        error: function(){
            $("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000).remove();
        }
    });
    
    return true;
}

function repcourse_remove(rep_id){
    $.ajax({
        type: "POST",
        url: '/mod/repeatcourse/index.php',
        data: "rep_id="+rep_id+"&action=delete_repcourse",
        success: function(){
            $("#repcourse_"+rep_id).remove();
            $("#result_msg").html('<span class="msg_success" style="display: none;">Successfully removed<span>');
            $(".msg_success").fadeIn(500).fadeOut(2000).remove();
        },
        error: function(){
            $("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000).remove();
        }
    });
    
    return true;
}