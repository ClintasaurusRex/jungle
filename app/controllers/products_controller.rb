class ProductsController < ApplicationController

  # GET /products
  # Retrieves all products and orders them by creation date (newest first)
  def index
    @products = Product.all.order(created_at: :desc)
  end

  # GET /products/:id
  # Finds and displays a specific product based on the provided ID
  def show
    @product = Product.find params[:id]
  end
end