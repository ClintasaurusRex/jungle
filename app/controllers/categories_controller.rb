class CategoriesController < ApplicationController
  # GET /categories/:id
  # Displays a specific category and its associated products
  def show
    # Find the category by its ID
    @category = Category.find(params[:id])

    # Retrieve all products belonging to this category, ordered by creation date (newest first)
    @products = @category.products.order(created_at: :desc)
  end

  # GET /categories/new
  # Displays a form for creating a new category
  def new
    # Initialize a new Category object
    @category = Category.new
  end
end