class Category < ApplicationRecord
# Establishes a one-to-many relationship with products
  has_many :products
end
