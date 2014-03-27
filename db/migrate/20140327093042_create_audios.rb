class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :name
      t.integer :lecture_id

      t.timestamps
    end
  end
end
