class AddUrlToAudio < ActiveRecord::Migration
  def change
    add_column :audios, :url, :string
  end
end
