class Category < ApplicationRecord
	has_many :projects
	has_many :questions

	validates :name, presence: true
end