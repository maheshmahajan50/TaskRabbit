# This class is for managing user model
# class user

require 'digest'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  # and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_one_attached :profile_image
  validates :email, presence: true,
             uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { in: 2..50 }
  validates :role, presence: true
  validates :phone, presence: true,
             numericality:{ message: ' must be of 10 digits number' }
end
