$(document).on('turbolinks:load', function() {
  $('input.rating[type=number]').rating();
  $(".join-event").click(function(){
    $("#new_user_event").submit();
  });
  $("#request-type").click(function() {
    $.post(
      "/request", {
        type: $(this).val()
      },
      function(data) {}
    );
  });

  App.init();
});

$(document).ready(function() {
});
