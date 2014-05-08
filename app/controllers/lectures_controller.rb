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
end
