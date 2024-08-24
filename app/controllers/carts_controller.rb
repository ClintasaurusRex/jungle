class CartsController < ApplicationController
  before_action :authorize

  # Display the contents of the cart
  def show
  end

  # Add an item to the cart
  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_back fallback_location: root_path
  end

  # Remove an item from the cart
  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_back fallback_location: root_path
  end

  private

  # Modify the quantity of a product in the cart

  def modify_cart_delta(product_id, delta)
    # Update the quantity of the product in the cart
    cart[product_id] = (cart[product_id] || 0) + delta

    # Remove the product from the cart if its quantity becomes less than 1
    cart.delete(product_id) if cart[product_id] < 1

    # Update the cart in the session
    update_cart cart
  end

end