$(function() {
  $( "#sortable" ).sortable({cancel : '.ce'});
    
    $( ".ce" ).attr("contentEditable",true);
  });