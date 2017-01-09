$(document).on('turbolinks:load', function() {
  $('input.rating[type=number]').rating();
  App.init();
});

$(document).ready(function() {
});
