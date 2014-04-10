class ImagesController < ApplicationController
  attr_accessor :expected_orders, :received_orders
  def initialize
    @received_orders = [1, 3, 4, 2, 5]
    @expected_orders = [1, 3, 4, 2, 5]
    #                1, 2, 3, 4, 5
    #new order should be id=>3, order=>2, etc
  end

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
    respond_to do |format|
      if @image.update(image_params)
        format.html { notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end
end
