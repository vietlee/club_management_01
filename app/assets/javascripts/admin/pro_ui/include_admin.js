$(document).on('turbolinks:load', function() {
  TablesDatatables.init();
  $(".toggle-sidebar").click(function(){
    App.sidebar('toggle-sidebar');
  });
});
