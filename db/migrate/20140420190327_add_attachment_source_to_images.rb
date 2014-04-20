class AddAttachmentSourceToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :source
    end
  end

  def self.down
    drop_attached_file :images, :source
  end
end
