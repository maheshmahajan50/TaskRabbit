class User < ApplicationRecord
   has_many :tasks,  dependent: :destroy

  def authenticate?(authentication_password)
    password_digest == authentication_password
  end




end