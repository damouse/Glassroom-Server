class Image < ActiveRecord::Base
	belongs_to :lecture
    validates :name, presence: true

    #new paperclip code
    has_attached_file :source, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "default.gif",
    :url => "/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension"

  	validates_attachment_content_type :source, :content_type => /\Aimage\/.*\Z/
end
