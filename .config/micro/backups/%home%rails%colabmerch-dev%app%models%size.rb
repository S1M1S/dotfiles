class Size < ApplicationRecord
	has_many :stocks
	has_many :items, through: :stocks
	has_many :fits, through: :stocks
end
