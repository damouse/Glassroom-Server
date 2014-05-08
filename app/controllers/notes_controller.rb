class NotesController < ApplicationController
  respond_to :json, :html
  
  def create
    url = params['url']
    split = url.split "/"
    id = split[split.length-1]

    @note = Note.create(lecture_id:id, text:' ')
    respond_with @note.id
  end

  def update
  	params['contents'].each do |key, val|
      split = key.split "_"
      note = Note.find_by_id(split[1])
      note.update_attributes(text:val)
    end

    render json: {}
  end

  def change_order
    list = params['order']
    count = 0

    #reorder the elements
    list.each do |element|
      split = element.split "_"

      if (split[0] == "Note")
        note = Note.find_by_id(split[1])
        note.update_attributes(order:count)
        puts 'Note with id ' + note.id.to_s + ' order ' + note.order.to_s
      else
        image = Image.find_by_id(split[1])
        image.update_attributes(order:count)
      end
      
      count += 1
    end

    puts list
    render nothing: true
  end

  def newest_image 
    url = params['url']
    split = url.split "/"
    id = split[split.length-1]

    lecture = Lecture.find_by_id(id)
    images = lecture.images

    max = 0
    images.each do |image|
      if image.id > max
        max = image.id
      end
    end

    image = Image.find_by_id(max)
    respond_with image
  end

  def delete
    args = params['id']
    split = args.split "_"
    id = split[1]

    if (split[0] == "Note")
      note = Note.find_by_id(id)
      note.destroy
    else
      image = Image.find_by_id(id)
      image.destroy()
    end
    
    render nothing: true
  end
end
