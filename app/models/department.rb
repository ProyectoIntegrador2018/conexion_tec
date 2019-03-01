class Department < ApplicationRecord
    has_many :professors
    has_many :judges

    validates :name, presence: true
end