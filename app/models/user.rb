class User < ApplicationRecord
  authenticates_with_sorcery!

  before_save { self.email = email.downcase }

  # has_one :judge
  # accepts_nested_attributes_for :judge

  # has_one :project
  # accepts_nested_attributes_for :project

  belongs_to :userable, polymorphic: true

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, :if => :password
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
	  								uniqueness: { case_sensitive: false }

  def judge?
    self.userable_type == "Judge"
  end

  def admin?
    self.userable_type == "Administrator"
  end

  def student?
    self.userable_type == "Student"
  end

  def professor?
    self.userable_type == "Professor"
  end

  def committee?
    self.userable_type == "Committee"
  end

  def operative?
    self.userable_type == "Operative"
  end

end
