$(function() {
  $( "#sortable" ).sortable({cancel : '.ce'});
    $( ".ce" ).attr("contentEditable",true);
  });

$(document).ready(function(){	

	$('#sortable').sortable({
		axis: 'y',
		dropOnEmpty: false,
		handle: '.handle',
		cursor: 'crosshair',
		items: 'li',
		opacity: 0.4,
		scroll: true,

		update: function(){

			$.ajax({
		        url: '/notes/change_order',
		        type: 'post',
		        data: $('#sortable')[0].children,
		        dataType: 'script',
		        complete: function(request){
		          $('#sortable').effect('highlight');
		        }
		      });
		}
	});
});