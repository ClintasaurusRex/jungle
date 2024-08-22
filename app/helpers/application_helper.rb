module ApplicationHelper

  def sold_out?
    quantity.zero?
  end

end
