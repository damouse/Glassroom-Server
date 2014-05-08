
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
		          
		        }
		      });
		}
	});
});

function addNote() {
	$.ajax({
        url: '/notes/create',
        type: 'get',
        data: {'url': window.location.href},
        dataType: 'script',
        complete: function(data){
        	var list = document.getElementById('sortable');

			var entry = document.createElement('li');
			var id = "Note_" + data.responseText
			entry.className = "sortable-wrapper"
			entry.setAttribute("id",id.toString())

			var handle = document.createElement('span');
			handle.className = "handle"
			handle.innerHTML = "[drag]"
			entry.appendChild(handle)

			var text = document.createElement('div');
			text.className = "ce"
			text.setAttribute("id","text")
			text.setAttribute("contenteditable", "true")
			entry.appendChild(text)

			list.appendChild(entry);
        }
     });
}

setInterval(function(){
	$.ajax({
        url: '/notes/newest_image',
        type: 'get',
        data: {'url': window.location.href},
        dataType: 'script',
        complete: function(data){
        	var obj = JSON.parse(data.responseText)
        	console.log(data.responseText)

        	var found = false
        	var largest = 0
			var list = $('#sortable')[0].children
			for (var i = 0; i < list.length; i++) {
				var name = list[i].id
				if (name.indexOf("Image") > -1) {
				   var index = name.split("_")[1]
				   if (parseInt(index) > largest) {
				   		largest = parseInt(index)
				   }
				}
			}

			if (obj['id'] > largest) {
		   		console.log(obj['id'] + ' is greater than ' + parseInt(index) + ' which is ' + index)
		   		found = true
		   }

			console.log("found? " + found + ' id: ' + obj['id'])
			if (found == true) {
				var list = document.getElementById('sortable');

				var entry = document.createElement('li');
				var id = "Image_" + obj['id']
				entry.className = "sortable-wrapper"
				entry.setAttribute("id",id.toString())

				var handle = document.createElement('span');
				handle.className = "handle"
				handle.innerHTML = "[drag]"
				entry.appendChild(handle)

				var image = document.createElement('img');
				image.setAttribute("src", obj['img_url'])
				image.setAttribute("alt", 'Test1')

				var div = document.createElement('div');
				div.className = "image-wrapper"
				div.appendChild(image)
				entry.appendChild(div)

				list.appendChild(entry);
			}
        }
     });

	console.log('tick')
}, 5000);

function deleteNote(id) {
	console.log(id)
	var list = document.getElementById('sortable')
	var child = document.getElementById(id)
	list.removeChild(child)

	$.ajax({
        url: '/notes/delete',
        type: 'get',
        data: {'id':id},
        dataType: 'script',
        complete: function(data){
        	console.log('Removed node')
        }
     });
}

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
        data: {'contents': ret, "url": window.location.href},
        dataType: 'script',
        complete: function(request){
          $('#sortable').effect('highlight');
        }
     });
}