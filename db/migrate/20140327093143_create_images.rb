class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.integer :lecture_id

      t.timestamps
    end
  end
end
