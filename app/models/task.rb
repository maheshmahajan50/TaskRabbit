class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: :true, length: {in: 6..30}
  validates :description, presence: :true, length: {minimum: 60}
  validates :company_name, presence: :true, length: {in: 6..30}
  validates :location, presence: :true, length: {in: 6..50}

end
