class Status < ApplicationRecord
  has_many :projects
  
  enum status: %i[not_grade graded not_approved not_professor_approved professor_rejected]
end