class Professor < ApplicationRecord
	has_many :projects
	belongs_to :department
	has_one :user, as: :userable
end
