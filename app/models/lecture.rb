class Lecture < ActiveRecord::Base
  belongs_to :subject
  has_many :audios
  has_many :videos
  has_many :notes
end
