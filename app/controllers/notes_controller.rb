class NotesController < ApplicationController
  respond_to :json, :html

  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new note_params
    @note.save
    respond_with @note
  end


  def update
  	@note = Note.find(params[:id])
  	@note.update(note_params)
  end

  def change_order
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
