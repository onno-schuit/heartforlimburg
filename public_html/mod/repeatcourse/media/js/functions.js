function add_rep_course() {
    var table = $("#coursetable");
    var row = $("#coursetable tr").eq(1).clone().appendTo(table);
    row.children().eq(0).html("");
    row.children().eq(1).html($("#course_selector :selected").html());
    row.children().eq(3).html($("#repcourse_interval").val());
	row.children().appendTo(table);
    return true;
}