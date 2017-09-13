$('.sort-bubget').dataTable( {
  destroy: true,
  columnDefs: [
    { type: 'date-dd-mmm-yyyy', targets: 0 }
   ]
});
