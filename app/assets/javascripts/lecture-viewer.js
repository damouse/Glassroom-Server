
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

	$("#new-note").on("newword:composer", function() {
	  console.log('newline')
	})

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

function deleteNote(id) {
	console.log(id)
	var list = document.getElementById('sortable')
	var child = document.getElementById(id)
	
	child.hide('slow', function(){ child.remove(); });

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

$(function(){
   $("#create_new_note_form").on("ajax:success", function(event, data){
    event.preventDefault();
      console.log("note create succ", data.text, data.name);
      //Clear out create form fields, so that user knows it's done and 
      //ready to be used for creating another new note
     $(".new_note_name").val('');
    $(".new_note_body").val('');
      //display the newly create note at top of the list
      var element = $('.note_list').prepend('<%= escape_javascript(render :partial => "lectures/note_update_form", :locals => {:note=> @blank_note})   %>');
      //injects the new values to the update form for this new note
      element.find('#id').first().val(data.id); 


      element.find('li').first().attr("id", "note_" + data.id);
      element.find("div.note_name").first().html(data.name);

      element.find("#note_text").first().val(data.text);
      //feed back delete url
      element.find(".destroy_note").first().attr("href", "/notes/delete/" + data.id);
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
        data: {'contents': ret, "url": window.location.href},
        dataType: 'script',
        complete: function(request){
          $('#sortable').effect('highlight');
        }
     });
}

