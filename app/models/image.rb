class Image < ActiveRecord::Base
	belongs_to :lecture
    validates :name, presence: true
end
