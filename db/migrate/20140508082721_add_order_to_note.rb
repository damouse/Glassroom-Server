class AddOrderToNote < ActiveRecord::Migration
  def change
    add_column :notes, :order, :integer
  end
end
