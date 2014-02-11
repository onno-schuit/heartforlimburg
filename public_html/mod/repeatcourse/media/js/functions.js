var _GET = {};

document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
    function decode(s) {
        return decodeURIComponent(s.split("+").join(" "));
    }

    _GET[decode(arguments[1])] = decode(arguments[2]);
});

function add_rep_course() {
    var id = _GET['id'];
    var selected_course = $("#course_selector :selected").html();
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
            $(".msg_success").fadeIn(500).fadeOut(2000);
            setInterval(function(){$(".msg_success").remove();}, 2000);
        },
        error: function(){
            $("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000);
            setInterval(function(){$(".msg_error").remove();}, 2000);
        }
    });
    
    return true;
};

function repcourse_remove(rep_id){
	var id = _GET['id'];
    $.ajax({
        type: "POST",
        url: '/mod/repeatcourse/index.php',
        data: "id="+id+"&rep_id="+rep_id+"&action=delete_repcourse",
        success: function(){
            $("#repcourse_"+rep_id).remove();
            $("#result_msg").html('<span class="msg_success" style="display: none;">Successfully removed<span>');
            $(".msg_success").fadeIn(500).fadeOut(2000);
            setInterval(function(){location.reload();}, 500);
        },
        error: function(){
            $("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000);
            setInterval(function(){$(".msg_error").remove();}, 2000);
        }
    });
    
    return true;
}

function priority_change(course_id, direction){
	var id = _GET['id'];
	direction = (direction == 1) ? 'up' : 'down';
	$.ajax({
		type: "POST",
		url: '/mod/repeatcourse/index.php',
		data: "id="+id+"&rep_course_id="+course_id+"&action=ordering_"+direction,
		success: function(){
			$("#result_msg").html('<span class="msg_success" style="display: none;">Successfully changed! Reloading page...<span>');
            $(".msg_success").fadeIn(500).fadeOut(1000);
            setInterval(function(){location.reload();}, 500);
		},
		error: function(){
			$("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000);
            setInterval(function(){$(".msg_error").remove();}, 2000);
		}
	});
}