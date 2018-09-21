class Project < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :field, presence: true
	validates :kind, presence: true
	validates :client, presence: true
	validates :abstract, presence: true
	validates :video_url, presence: true
	validates :status, presence: true
	has_many :students
end
