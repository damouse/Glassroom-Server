class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.date :created_on
      t.references :lecture, index: true
      t.string :uri

      t.timestamps
    end
  end
end
