//= require jquery-ui

  $(function() {
    $( "#lecture-img-sortable" ).sortable({
    	update: function (event, ui) {
 
                           var list =  $(this).sortable("toArray");
                           //var lis = $(this).children();
                           //var order = $(this).index(currentID);
                           
                           $.ajax({   url: "/images/change_order",
                                      data: {              
                                                  'new_order': list
                                            }
                                  });

						console.log(list);
                  }
    });
    $( "#lecture-img-sortable" ).disableSelection();
  });
