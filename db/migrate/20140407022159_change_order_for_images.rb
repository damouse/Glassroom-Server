class ChangeOrderForImages < ActiveRecord::Migration
  def change
  	remove_column :notes, :name
  end
end
