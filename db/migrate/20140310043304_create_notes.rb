class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.date :created_on
      t.references :lecture, index: true
      t.string :uri

      t.timestamps
    end
  end
end
