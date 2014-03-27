class Video < ActiveRecord::Base
	belongs_to :lecture
  validates :name, presence: true
end
