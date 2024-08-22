module ProductHelper
  def sold_out_badge(product)
    if product.sold_out?
      content_tag(:span, "SOLD OUT", class: "soldout")
    end
  end
end
