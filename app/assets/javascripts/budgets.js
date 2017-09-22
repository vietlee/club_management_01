$(function(){ TablesDatatables.init(); });
$(document).ready(function () {
  $('#budget-filter').change(function(){
    var first_date = $('#date_first').val();
    var second_date = $('#date_end').val();
    var club_id = $('#club_id').val();
    var data = {date_search: {first_date: first_date,
      second_date: second_date}}
    $.get('/dashboard/budgets/' + club_id, data , null, 'script');
    return false;
  });
});
