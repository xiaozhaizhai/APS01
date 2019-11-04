function adjustStyle(width) {
    width = parseInt(width);
    if (width > 1024) {
        $("#size-stylesheet").attr("href", "/bap/struts/css/navigateLowerIE8.css");
    } else {
       $("#size-stylesheet").attr("href", ""); 
    }
}

$(function() {
    adjustStyle($(this).width());
    $(window).resize(function() {
        adjustStyle($(this).width());
    });
});