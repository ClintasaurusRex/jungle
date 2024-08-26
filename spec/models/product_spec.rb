require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      category = Category.create(name: "Test Category")
      product = Product.new(
        name: "Test Product",
        price: 100,
        quantity: 10,
        category: category
      )
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      category = Category.create(name: "Test Category")
      product = Product.new(
        price: 100,
        quantity: 10,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      category = Category.create(name: "Test Category")
      product = Product.new(
        name: "Test Product",
        quantity: 10,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      category = Category.create(name: "Test Category")
      product = Product.new(
        name: "Test Product",
        price: 100,
        category: category
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      product = Product.new(
        name: "Test Product",
        price: 100,
        quantity: 10
      )
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end