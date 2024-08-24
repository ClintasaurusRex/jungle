module ApplicationHelper
  # Helper method to check if an item is sold out
  #
  # @return [Boolean] true if the quantity is zero, false otherwise
  def sold_out?
    quantity.zero?
  end

  # disables the create category button if the field isnt filled
  def button_disabled?(form)
    form.object.name.blank? ? 'disabled' : ''
  end
end