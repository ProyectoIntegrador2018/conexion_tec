class Committee < ApplicationRecord
	has_one :user, as: :userable
end