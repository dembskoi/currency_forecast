$(document).ready(function() {
  $('#calculations_table').dataTable({
    columnDefs: [
      { bSortable: false, aTargets: [4, 5, 6] }
    ],
    "bDestroy": true
  });
} );