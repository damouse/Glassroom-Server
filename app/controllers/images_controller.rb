class ImagesController < ApplicationController
  respond_to :html, :json
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
  end

  

  def check_incoming
    currMaxId = params[:maxImageId]
    @images = Image.where("id > ?", currMaxId.to_i)
    respond_with @images
  end

  def sort_order
  end

  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
  end

  def delete
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to(:back)
  end

  private
    def image_params
      params.fetch(:image, {}).permit(:name)
    end
end
