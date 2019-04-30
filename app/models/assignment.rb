class Assignment < ApplicationRecord
    belongs_to :judge
    belongs_to :project
    has_one :evaluation
end