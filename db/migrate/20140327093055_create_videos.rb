class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :lecture_id

      t.timestamps
    end
  end
end
