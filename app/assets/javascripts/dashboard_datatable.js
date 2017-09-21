var TablesDatatables = function() {
  return {
    init: function() {
      App.datatables();
      $('.datatable-public').dataTable();
    }
  };
}();
$(document).ready(function() {
  TablesDatatables.init();
});
