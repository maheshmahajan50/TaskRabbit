class Category < ApplicationRecord
	has_many :tasks,   dependent: :destroy
end
