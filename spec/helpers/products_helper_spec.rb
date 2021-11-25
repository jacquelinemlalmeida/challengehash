require 'rails_helper'

RSpec.describe ProductsHelper do
include FakeDatabaseHelper

  before do
    @products_list = [{
      "id" => 1,
      "quantity" => 2
    }]
  end
  
  describe "#load_products_by_ids" do
    it "returns a products from json database" do
      expect(load_products_by_ids(@products_list)).to eq [{
        "id" => 1,
        "title" => "Ergonomic Wooden Pants",
        "description" => "Deleniti beatae porro.",
        "amount" => 15157,
        "is_gift" => false,
        "quantity" => 2
      }]
    end
  end

  describe "#product_discount" do 
    it "return not discount if discount service is down" do 
      expect(product_discount(load_products_by_ids(@products_list).first)).to be 0
    end  
  end
end

