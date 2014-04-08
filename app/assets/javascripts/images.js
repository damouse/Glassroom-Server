//= require jquery-ui
  $(function() {
    $( "#lecture-img-sortable" ).sortable({
    	update: function (event, ui) {
 
                           var list =  $(this).sortable("toArray").join("|");
                           var currentID = this.id;
                           //var order = $(this).index(currentID);
                           /*
                           $.ajax({   url: "/persistListOrder.php",
                                      data: { 
                                                  'section':this.id,              
                                                  'components': list
                                            }
                                  });
*/
						console.log(list);
                  }
    });
    $( "#lecture-img-sortable" ).disableSelection();
  });
  $("#change-img-order").click(function(){
  	$("form").submit();
  });
