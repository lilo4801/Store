class User < ApplicationRecord
  has_secure_password
   has_many :books
  validates :mail ,:password,:password_confirmation,  presence: true
  validates :password, confirmation: true
end
