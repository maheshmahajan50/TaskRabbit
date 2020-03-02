require 'digest'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks,  dependent: :destroy
  has_one_attached :profile_image

  validates :email, presence: :true, 
             uniqueness:  { case_sensitive: false }
  validates :name, presence: :true, length: { in: 2..50 }
  #validates :password_digest, presence: :true, length: { in: 6..20 }
  validates :role, presence: :true
  validates :phone, presence: :true, 
             numericality: {message: "%{attribute} must be of 10 digits number"}
  
  
  # def enc(string)
  #   Digest::MD5.hexdigest string
  # end

  # def password
  #   password_digest
  # end
 
  # def authenticate?(authentication_password)
  #   password == enc(authentication_password)
  # end

  # def password=(authentication_password)
  #   self.password_digest = enc(authentication_password)
  # end

  # def password!(authentication_password)
  #   self.password = authentication_password
  #   save!
  # end
  
end