$(document).ready(function() {
    if($("#mailing").prop('checked')){
        $("#ismailing").val(1);
    } else {
        $("#ismailing").val(0);
    }
});

$("#mailing").change(function(){
    if($("#mailing").prop('checked')){
        $("#ismailing").val(1);
    } else {
        $("#ismailing").val(0);
    }
});