class ImagesController < ApplicationController
  def edit
  end

  def change_order
    render :text=>params[:id]
    return
  end

  def sort_order
  end

  def update
  end

  def delete
  end
end
