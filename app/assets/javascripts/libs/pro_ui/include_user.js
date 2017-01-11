$(document).on('turbolinks:load', function() {
  $('input.rating[type=number]').rating();
  $(".join-event").click(function(){
    $("#new_user_event").submit();
  });
  App.init();
});

$(document).ready(function() {
});
