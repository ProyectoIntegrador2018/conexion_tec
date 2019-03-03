class Client < ApplicationRecord
    has_many :projects

    validates :client, presence: true
end