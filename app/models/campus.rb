class Campus < ApplicationRecord
  has_many :projects

  validates :name,
            :code,
            presence: true
end
