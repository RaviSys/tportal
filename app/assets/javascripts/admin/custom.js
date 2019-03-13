$(document).ready(function(){
  $("#user_role").on('change', function(){
    if ($(this).children("option:selected").val() == 'participant') {
      $("#mentor_block").css({"display": "block"})
    } else {
      $("#mentor_block").css({"display": "none"})
    }
  });
  $("#user_role").on('change', function(){
    if ($(this).children("option:selected").val() == 'mentor') {
      $("#mentor_group_block").css({"display": "block"})
    } else {
      $("#mentor_group_block").css({"display": "none"})
    }
  });
});