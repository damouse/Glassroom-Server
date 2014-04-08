//= require jquery-ui
  $(function() {
    $( "#lecture-img-sortable" ).sortable({
    	update: function (event, ui) {
 
                           var list =  $(this).sortable("toArray").join("|");
                           //var currentID = this.id;
                           //var order = $(this).index(currentID);
                           
                           $.ajax({   url: "/images/change_order",
                                      data: { 
                                                 // 'section':this.id,              
                                                  'id': list
                                            }
                                  });

						console.log(list);
                  }
    });
    $( "#lecture-img-sortable" ).disableSelection();
  });
