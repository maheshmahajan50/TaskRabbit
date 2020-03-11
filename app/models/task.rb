# This class is for managing task model
# class Task
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true, length: { in: 6..60 }
  validates :description, presence: true, length: { minimum: 60 }
  validates :company_name, presence: true, length: { in: 6..50 }
  validates :location, presence: true, length: { in: 6..50 }
  scope :with_order, -> { order(updated_at: :desc)}
  scope :with_category, -> (id) { where(category_id: id)}
end
