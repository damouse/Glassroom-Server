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
			var list = $('#sortable')[0].children
			var ret = new Array(list.length)

			for (var i = 0; i < list.length; i++) {
				ret[i] = list[i].id
			}

			console.log(ret)
			$.ajax({
		        url: '/notes/change_order',
		        type: 'post',
		        data: {'order': ret},
		        dataType: 'script',
		        complete: function(request){
		          $('#sortable').effect('highlight');
		        }
		      });
		}
	});
});