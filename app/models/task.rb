class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  
end
