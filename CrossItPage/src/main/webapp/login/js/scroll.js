$(document).ready(function() {
  $('#agree').attr("disabled", true);
  $('#terms').scroll(function() {
    if ($(this).scrollTop() + $(this).innerHeight() == $(this).prop("scrollHeight")) {
      $('#agree').removeAttr('disabled');
    } else {
      $('#agree').attr("disabled", true);
    }
  });
});