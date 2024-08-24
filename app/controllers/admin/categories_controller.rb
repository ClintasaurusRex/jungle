class Admin::CategoriesController < ApplicationController
  def index
    @products = Product.order(id: :desc).all
    @categories = Category.all
  end

  def new
    @product = Product.new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(
      :name,

    )
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to [:admin, :categories], notice: "Category deleted"
  end
end
