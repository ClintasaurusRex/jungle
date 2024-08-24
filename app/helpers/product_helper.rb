module ProductHelper
  # Generates a "SOLD OUT" badge for products that are out of stock

  def sold_out_badge(product)
    if product.sold_out?
      # Create a span element with "SOLD OUT" text and "soldout" CSS class
      content_tag(:span, "SOLD OUT", class: "soldout")
    end
  end
end