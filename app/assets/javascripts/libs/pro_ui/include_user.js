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
  $("#ecom-filter-rating").change(function(){
  $("#ecom-search").attr("name", "q[rating_eq]");
  $("#ecom-search").val($(this).val());
  $("#club_search").submit();
  $("#example-datatable").dataTable();

  $(".container-chat").hover(function(){
    $('div').animate({scrollTop: $('#viewport-content ul').height()});
  });

  $('a[data-toggle="collapse"]').click(function () {
    $(this).find('span.toggle-icon').toggleClass('fa fa-envelope-open-o fa fa-envelope-o');
  });
});
