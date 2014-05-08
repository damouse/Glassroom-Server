class LecturesController < ApplicationController
  def lecture_viewer
  	@lecture = Lecture.find(params[:id])
    @new_note = Note.new(note_params)
  	@notes = @lecture.notes.order("created_at DESC")
    @blank_note = Note.new
    @blank_image = Image.new
  	@images = (@lecture.images).order(:order)
  	@audio = @lecture.audios
  	@video = @lecture.videos 
  end

  def lecture_viewer_two
    @lecture = Lecture.find(params[:id])
    @elements = @lecture.notes + @lecture.images

    #remove duplicates when order and text are the same
    @elements.uniq!

    #check to make sure the notes have been given an order, else order them after
    #the existing ones
    largest = 0

    unordered = Array.new()

    @elements.each do |element|
      if element.order == nil
        unordered.push(element)
      elsif element.order > largest
        largest = element.order
      end
    end

    unordered.each do |element|
      largest += 1
      element.update_attributes(order:largest)
    end



    @elements.sort_by! do |element|
      element.order
    end
  end
 
  def most_recent_note
  end

  #media creation methods, only accessible through API (excepting note)
  def create_note

  end

  def create_audio

  end

  def create_video

  end

  def create_image

  end
  private
    def note_params
      params.fetch(:note, {}).permit(:text, :name, :lecture_id)
       #params.require(:note).permit(:text)
    end
end
