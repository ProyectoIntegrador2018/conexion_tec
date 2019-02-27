class Department < ApplicationRecord
    has_many :professors
    has_many :judges
end