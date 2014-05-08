class NotesController < ApplicationController
  respond_to :json, :html

  def new
    @note = Note.new
  end
  
  def create
    url = params['url']
    id = url[-1, 1]

    @note = Note.create(lecture_id:id, text:' ')
    respond_with @note.id
  end

  def update
  	params['contents'].each do |key, val|
      split = key.split "_"
      note = Note.find_by_id(split[1])
      note.update_attributes(text:val)
    end

    render nothing: true
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

  def delete
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to(:back)
  end

  private
    def note_params
    	params.fetch(:note, {}).permit(:text, :name, :lecture_id)
       #params.require(:note).permit(:text)
   	end
end
