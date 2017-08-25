jQuery(document).ready(function($) {
  $(document).on('change', '.checkbox_admin',function() {
    var is_manager = $(this).prop("checked");
    var member = $(this).val();
    var club = $('.club-member').val();
    $.ajax({
      url: '/club_manager/clubs/' + club + '/requests/'+ member,
      type:'PATCH',
      data: {is_manager: is_manager},
      dataType: 'json',
      success: function(data){
        if(data.status === 200) {
        $('#page-container').append('<section class="notify">'+
            '<div class = "alert alert-success">'+
              '<a href = "#", class = "close-message">'+
                '<span class="fa fa-times"></span></a>'+
                  data.flash+
            '</div>'+
          '</section>');
        turbolink_app();
      }},
      error: function(data){
        $('#page-container').append('<section class="notify">'+
            '<div class = "alert alert-danger">'+
              '<a href = "#", class = "close-message">'+
                '<span class="fa fa-times"></span></a>'+
                  data.flash+
            '</div>'+
          '</section>');
        turbolink_app();
      }
    });
  });
});
