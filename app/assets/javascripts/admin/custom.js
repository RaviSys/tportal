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

  $("#tutors_program_id").on('change', function(){
    var programId = $(this).children("option:selected").val();
    if (programId > 0) {
      $.ajax({
        url: '/admin/programs/'+ programId +'/check_if_assigned_to_tutors',
        type: 'GET'
      });
    } else {
      $.ajax({
        url: '/admin/programs/blank/check_if_assigned_to_tutors',
        type: 'GET'
      });
    }
  });

  $("#participants_program_id").on('change', function(){
    var programId = $(this).children("option:selected").val();
    if (programId > 0) {
      $.ajax({
        url: '/admin/programs/'+ programId +'/check_if_assigned_to_participants',
        type: 'GET'
      });
    } else {
      $.ajax({
        url: '/admin/programs/blank/check_if_assigned_to_participants',
        type: 'GET'
      });
    }
  });
});