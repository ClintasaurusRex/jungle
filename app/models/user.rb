class User < ApplicationRecord
  # Adds methods to set and authenticate against a BCrypt password
  has_secure_password

   # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true


end
