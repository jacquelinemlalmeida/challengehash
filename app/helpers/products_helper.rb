require 'json'
require_relative '../services/discount_services_pb'

module ProductsHelper
  include FakeDatabaseHelper

  def load_products_by_ids(products_list)
    return if products_list.nil?
    products = []
  
    products_list.each do | product |
      products << database.detect{|data| data["id"] == product["id"]}
      products.last["quantity"] = product["quantity"]
    end

    products
  end

  def calculate_products_discount(products)
    return if products.nil?

    products.each do | product |
      product["discount"] = (product["amount"] * product["quantity"] * product_discount(product))
    end
    
    products
  end

  def select_gifts_products(products)
    products.select{|product| product["is_gift"] == true}
  end

  def product_discount(product)
    client = Discount::Discount::Stub.new('localhost:50051', :this_channel_is_insecure)
    begin
      discount = client.get_discount(Discount::GetDiscountRequest.new(productID: product["id"])).message
    rescue
      discount = 0
    end  
    discount
  end
end