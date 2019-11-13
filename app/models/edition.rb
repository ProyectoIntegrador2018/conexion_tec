class Edition < ApplicationRecord
  has_many :projects

  validates :number,
            presence: true
end