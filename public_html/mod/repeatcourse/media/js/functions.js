var _GET = {};

document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
    function decode(s) {
        return decodeURIComponent(s.split("+").join(" "));
    }

    _GET[decode(arguments[1])] = decode(arguments[2]);
});
 
function add_rep_course() {
    var id = _GET['id']; console.log(id);
    var maincourseid = _GET['maincourseid']; console.log(maincourseid);
    var selected_course_id = $("#course_selector :selected").val(); console.log(selected_course_id);
    var coursename = $("#course_selector :selected").html(); console.log(coursename);
    var data = "id="+id+"&selected_course_id="+selected_course_id+"&interval="+$("#repcourse_interval").val()+"&action=add_repcourse&maincourseid="+maincourseid; console.log(data);
    var interval_str = ($("#repcourse_interval").val() == 1) ? $("#repcourse_interval").val() + ' day' : $("#repcourse_interval").val() + ' days'; console.log(interval_str);
    $.ajax({
        type: "POST",
        url: '/mod/repeatcourse/index.php',
        data: data,
        success: function(){
            var table = $("#coursetable");
            var row = $("#coursetable tr").eq(1).clone().appendTo(table);
            row.children().eq(0).html();
            row.children().eq(1).html(coursename);
            row.children().eq(3).html(interval_str);
            $("#course_selector :selected").remove();
            if($("#course_selector").children().length == 0){
                $(".available_courses").hide();
            }
            $("#result_msg").html('<span class="msg_success" style="display: none;">Successfully saved<span>');
            $(".msg_success").fadeIn(500).fadeOut(2000);
            //setInterval(function(){location.href = window.location.pathname+'?id='+id+"&main_course_id="+main_course_id;}, 500);
            setInterval(function(){location.reload();}, 500);
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
	var maincourseid = _GET['maincourseid'];
    $.ajax({
        type: "POST",
        url: '/mod/repeatcourse/index.php',
        data: "id="+id+"&rep_id="+rep_id+"&action=delete_repcourse",
        success: function(){
            $("#repcourse_"+rep_id).remove();
            $("#result_msg").html('<span class="msg_success" style="display: none;">Successfully removed<span>');
            $(".msg_success").fadeIn(500).fadeOut(2000);
            setInterval(function(){location.href = window.location.pathname+'?id='+id+"&maincourseid="+maincourseid;}, 500);
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

function main_course_selecta(mcourseid){
	var id = _GET['id'];
    if(mcourseid == 0){
        mcourseid = $("#main_courses option:selected").val();
    }
	var dataStr = "id="+id+"&maincourseid="+mcourseid;

    location.href = window.location.pathname+"?"+dataStr;
	/*$.ajax({
		type: "GET",
		url: window.location.pathname,
		data: dataStr,
		success: function(){
			
		},
		error: function(){
			$("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000);
            setInterval(function(){$(".msg_error").remove();}, 2000);
		}
	});*/
}

function main_course_remova(mcid){
	var id = _GET['id'];
	$.ajax({
		type: "POST",
		data: "id="+id+"&action=main_course_remova"+"&mcid="+mcid,
		success: function(){
			$("#result_msg").html('<span class="msg_success" style="display: none;">Successfully removed! Reloading page...<span>');
            $(".msg_success").fadeIn(500).fadeOut(1000);
            setInterval(function(){location.reload();}, 500);
		},
		error: function(){
			$("#result_msg").html('<span class="msg_error" style="display: none;">Something going wrong. Try again later.<span>');
            $(".msg_error").fadeIn(500).fadeOut(2000);
            setInterval(function(){location.reload();}, 500);
		}
	});
}