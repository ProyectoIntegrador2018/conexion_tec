class Status < ApplicationRecord
  has_many :projects
  
  enum status: %i[not_graded graded not_approved approved not_professor_approved professor_rejected]
end