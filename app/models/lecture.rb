class Lecture < ActiveRecord::Base
  validates :name, presence: true
	belongs_to :subject
	has_many :notes
	has_many :audios
	has_many :videos 
	has_many :images
end
