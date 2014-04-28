class NotesController < ApplicationController
  def create
  end

  def update
  	@note = Note.find(params[:id])
  	@note.update(note_params)
  end

  def change_order
  end

  def delete
  end

  private
    def note_params
    	params.fetch(:note, {}).permit(:text)
       #params.require(:note).permit(:text)
   	end
end
