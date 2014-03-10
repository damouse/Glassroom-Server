class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :icon
      t.date :created_on
      t.date :last_updated
      t.references :subject, index: true

      t.timestamps
    end
  end
end
