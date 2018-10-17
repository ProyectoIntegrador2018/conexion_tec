class User < ApplicationRecord
  authenticates_with_sorcery!

  before_save { self.email = email.downcase }

  has_one :judge
  accepts_nested_attributes_for :judge

  has_one :project
  accepts_nested_attributes_for :project

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
	  								uniqueness: { case_sensitive: false }

	def is_judge?
		self.judge.present?
	end

  def is_admin?
    self.role == 'admin'
  end

  def is_project?
    self.project.present?
  end

end
