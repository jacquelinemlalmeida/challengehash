require 'rails_helper'

RSpec.describe OrderHelper do
include OrderHelper
include ProductsHelper

  before do
    @order = [{
      "id" => 1,
      "title" => "Balinha de Goma",
      "description" => "Uma bala muito boa",
      "quantity" => 2,
      "amount" => 100,
      "discount" => 0.1,
      "is_gift" => false
    }]
  end
  
  describe "#add_gift_to_order" do
    it "returns a order with gift" do
      expect(@order.size).to be == 1
      expect(@order.last).to include({"is_gift" => false})
      
      order_with_gift = add_gift_to_order(@order)

      expect(order_with_gift.size).to be == 2  
      expect(order_with_gift.last).to include({"is_gift" => true})
    end
  end

  describe "#create_order_response" do
    it "returns a response order" do
      expect(create_order_response(@order)).to eq ({
          "total_amount" => 200,
          "total_amount_with_discount" => 180.0,
          "total_discount" => 20.0,
          "products" => [{
            "discount" => 0.1, 
            "id" => 1, 
            "is_gift" => false, 
            "quantity" => 2, 
            "total_amount" => 200, 
            "unit_amount" => 100}],
        })
    end
  end

end