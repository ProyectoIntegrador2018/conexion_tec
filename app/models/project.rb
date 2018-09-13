class Project < ApplicationRecord
	before_save { self.email = email.downcase }

	attr_accessor :name, :email
	validates :name, presence: true
	validates :password, presence: true, length: { minimum: 8 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
	  								uniqueness: { case_sensitive: false }

	has_secure_password
	has_many :students

end
