module ValidatesHelper

  include ProductsHelper

  def is_black_friday?
    black_friday_date = Rails.application.config.black_friday_date
    return false if black_friday_date != Date.current
    true
  end

  def has_gift_product_in_cart?(products_list)
    return true if select_gifts_products(products_list).any?
    false
  end
end