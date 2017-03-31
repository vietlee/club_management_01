$(document).on('turbolinks:load', function() {
  $('input.rating[type=number]').rating();

  $("#ecom-filter-rating").change(function(){
    $("#ecom-search").attr("name", "q[rating_eq]");
    $("#ecom-search").val($(this).val());
    $("#club_search").submit();
    $("#example-datatable").dataTable();
  });

  $("#ecom-filter-condition").change(function(){
    $("#ecom-search").attr("name", "q[club_type_eq]");
    $("#ecom-search").val($(this).val());
    $("#club_search").submit();
    $("#example-datatable").dataTable();
  });

  $(".join-event").click(function(){
    $("#new_user_event").submit();
  });

  $("#request-type").click(function() {
    if ($(this).val() == "Organization"){
      $.get(
        "/users/1/organization_requests", {
          type: $(this).val()
        },
        function(data) {}
      );
    }else{
      $.get(
        "/users/1/club_requests", {
          type: $(this).val()
        },
        function(data) {}
      );
    }
  });

  $(".org-link-to").click(function(){
    window.open($(this).attr("data-link"), "_self");
  });
  App.init();
});

$(document).ready(function() {
  $("#ecom-filter-rating").change(function(){
    $("#ecom-search").attr("name", "q[rating_eq]");
    $("#ecom-search").val($(this).val());
    $("#club_search").submit();
  });

  $("#example-datatable").dataTable();

  $(".container-chat").hover(function(){
    $('div').animate({scrollTop: $('#viewport-content ul').height()});
  });

  $('a[data-toggle="collapse"]').click(function () {
    $(this).find('span.toggle-icon').toggleClass('fa fa-envelope-open-o fa fa-envelope-o');
  });
});
