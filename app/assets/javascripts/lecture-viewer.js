
$(function() {
  $( "#sortable" ).sortable({cancel : '.ce'});
  });

$(document).ready(function(){	
	$(".ce").focus(function(eventObject){
		update()
	});

	$(".ce").blur(function(eventObject){
    	update()
	});


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

function update() {
	var list = $('#sortable')[0].children
	var ret = {}

	for (var i = 0; i < list.length; i++) {
		var name = list[i].id
		if (name.indexOf("Note") > -1){
	        ret[name] = list[i].children[1].innerHTML
	    }
	}

	$.ajax({
        url: '/notes/update',
        type: 'post',
        data: {'contents': ret},
        dataType: 'script',
        complete: function(request){
          $('#sortable').effect('highlight');
        }
     });
}