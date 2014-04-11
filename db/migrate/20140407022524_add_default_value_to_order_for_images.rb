class AddDefaultValueToOrderForImages < ActiveRecord::Migration
	def up
		change_column :images, :order, :integer, :default => 0
	end

	def down
		change_column :images, :order, :integer, :default => nil
	end
end
