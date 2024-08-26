class User < ApplicationRecord
  # Adds methods to set and authenticate against a BCrypt password
  has_secure_password

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    # Remove leading and trailing whitespace from email
    email = email.strip.downcase

    # Find user by email (case-insensitive)
    user = User.find_by_email(email)

    # If user exists and password is correct, return user; otherwise, return nil
    user && user.authenticate(password) ? user : nil
  end
end