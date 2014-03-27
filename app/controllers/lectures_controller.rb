class LecturesController < ApplicationController
  def lecture_viewer
  	#testing lecture retrieval
  	@lecture = Lecture.find(params[:id])
  	@notes = @lecture.notes
  	@images = @lecture.images
  	@audio = @lecture.audios
  	@video = @lecture.videos
  end
end
