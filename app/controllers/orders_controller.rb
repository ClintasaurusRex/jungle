class OrdersController < ApplicationController

  # Display details of a specific order
  def show
    @order = Order.find(params[:id])
  end

  # Process the creation of a new order
  def create
    begin
      # Attempt to charge the customer using Stripe
      charge = perform_stripe_charge
      # Create a new order based on the successful charge
      order  = create_order(charge)

      if order.valid?
        # Clear the cart after successful order placement
        empty_cart!
        redirect_to order, notice: 'Your Order has been placed.'
      else
        # Redirect back to cart if order creation fails
        redirect_to cart_path, flash: { error: order.errors.full_messages.first }
      end

    rescue Stripe::CardError => e
      # Handle Stripe payment errors
      redirect_to cart_path, flash: { error: e.message }
    end
  end

  private

  # Clear the shopping cart
  def empty_cart!
    # Empty hash means no products in cart
    update_cart({})
  end

  # Process the Stripe payment
  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  # Create a new order in the database
  def create_order(stripe_charge)
    # Initialize new order with basic information
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    # Add line items to the order based on cart contents
    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end

    # Save the order and return it
    order.save!
    order
  end
end