# This class is for managing category model
# class Category 
class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
