require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a valid user with all required fields' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to be_valid
    end

    it 'should require password and password_confirmation fields' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should ensure password and password_confirmation match' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password123',
        password_confirmation: 'password456'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should require email to be unique (case insensitive)' do
      User.create!(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.COM',
        password: 'password123',
        password_confirmation: 'password123'
      )
      user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'TEST@TEST.com',
        password: 'password456',
        password_confirmation: 'password456'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it 'should require email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should require first name' do
      user = User.new(
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should require last name' do
      user = User.new(
        first_name: 'John',
        email: 'john@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
  end
end

describe '.authenticate_with_credentials' do
  # Examples for this class method go here

  it 'authenticates a user with valid credentials' do
    # Test case for valid authentication
  end

  it 'does not authenticate a user with invalid credentials' do
    # Test case for invalid authentication
  end

  it 'authenticates a user with spaces around email' do
    # Test case for email with leading/trailing spaces
  end

  it 'authenticates a user with wrong case email' do
    # Test case for email with mixed case
  end

  # Add more test cases as needed
end
