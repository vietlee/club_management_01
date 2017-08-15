$(document).on('turbolinks:load', function() {
  $('.tab_content_account .tab_account_content:not(:first)').hide();
  $('.tab_my_account li a').click(function(){
    $('.tab_content_account .tab_account_content').hide('slow');
    $('.tab_my_account li a').removeClass('active');
    $(this).addClass('active');
    var id=$(this).attr('href');
    $(id).show('slow');
    return false;
  });
});
