class ImagesController < ApplicationController
 

  def edit
  end

  def change_order
   # puts params[:new_order]
   #render :text=>"here"
    curr_order = 1
    @new_ids = params[:new_order]
    #@lecture = Lecture.find(@new_ids.first)
    #@images = Image.find(params[:new_order])
    
    @new_ids.each do |i|
      @image = Image.find(i);
      @image.update_attribute(:order, curr_order)
      curr_order = curr_order + 1
    end
    #redirect_to subjects_path
    return
  end

  def sort_order
  end

  def update
  end

  def delete
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to(:back)
  end
end
