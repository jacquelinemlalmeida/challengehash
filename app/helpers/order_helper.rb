require 'json'

module OrderHelper
  include FakeDatabaseHelper

  def add_gift_to_order(order)
    gifts_products = select_gifts_products(database)
    gift = gifts_products.shuffle.first
    
    order << gift.merge({"quantity" => 1, "discount" => 0})
  end

  def create_order_response(order)
    total_amount = 0
    total_amount_with_discount = 0
    total_discount = 0
    products = []

    order.each do | product_in_order |
      print(product_in_order)
      product_hash = {
        "id" => product_in_order["id"],
        "quantity" => product_in_order["quantity"],
        "unit_amount" => product_in_order["amount"],
        "total_amount" => product_in_order["amount"] * product_in_order["quantity"],
        "discount" => product_in_order["discount"],
        "is_gift" => product_in_order["is_gift"]
      }
      total_amount += product_hash["total_amount"]
      total_amount_with_discount += (total_amount - product_hash["discount"])
      total_discount += product_hash["discount"]

      products << product_hash
    end

    {
      "total_amount" => total_amount,
      "total_amount_with_discount" => total_amount_with_discount,
      "total_discount" => total_discount
    }.merge({"products": products})
  end
end