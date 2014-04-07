class LecturesController < ApplicationController
  def lecture_viewer
  	@lecture = Lecture.find(params[:id])
  	@notes = @lecture.notes
  	@images = (@lecture.images).order(:order)
  	@audio = @lecture.audios
  	@video = @lecture.videos
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
end
