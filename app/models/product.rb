class Product < ApplicationRecord
  has_many :line_items
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
# Sold out helper method
  def sold_out?
    quantity.zero?
  end
end
