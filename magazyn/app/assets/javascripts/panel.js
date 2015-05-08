$(document).ready( function () {
  if(typeof data_table_init_order==='undefined') data_table_init_order = [];
  if(typeof data_table_column_defs==='undefined') data_table_column_defs = [];
  $('#group').dataTable( {
    "bFilter": true,
    "order": data_table_init_order,
    "columnDefs": data_table_column_defs
  } );
} );

$(document).ready( function () {
  $('#modal-table').dataTable( {
    "bFilter": true
  } );
} );



function add(){
  $( "#show_add" ).click(function() {
    $( ".add" ).show(1000);
  });
}