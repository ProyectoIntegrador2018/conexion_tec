class Collaborator < ApplicationRecord
  belongs_to :major
  belongs_to :project
end
