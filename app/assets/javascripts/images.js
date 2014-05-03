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
  /*
  $(function(){
        //for delete
    
    $(".destroy_image").click(function(event){
      //$(this).prop('disabled', true);
      var clickedButton = $(".destroy_image");
      var imageID = clickedButton.parent().parent().attr("id");
      var deleteImageReq = $.ajax({
        url: "/images/delete",
        data:{
          "delete_imageID":imageID
          //"delete_imageID":16;
        }
      });
      console.log(imageID);
      deleteImageReq.always(function(){
        clickedButton.prop('disabled', false);
      });

    });
  });
*/