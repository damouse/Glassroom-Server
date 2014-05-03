class LecturesController < ApplicationController
  def lecture_viewer
  	@lecture = Lecture.find(params[:id])
    @new_note = Note.new(note_params)
  	@notes = @lecture.notes
    @blank_note = Note.new
  	@images = (@lecture.images).order(:order)
  	@audio = @lecture.audios
  	@video = @lecture.videos 
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
