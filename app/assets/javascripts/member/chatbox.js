$(document).on('turbolinks:load', function() {
  $('.icon_chat').click(function() {
    $('.custom_chatbox').toggle('slow');
  });
  $('.toggle-chat .icon-status').click(function() {
    $('.custom_chatbox').toggle('slow');
  });
});
