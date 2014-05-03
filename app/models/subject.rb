class Subject < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
	has_many :lectures
	belongs_to :user
end
