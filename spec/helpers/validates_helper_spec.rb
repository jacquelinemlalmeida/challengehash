require 'rails_helper'

RSpec.describe ValidatesHelper do

  before do
    @products_list_with_gift = [{
      "id" => 1,
      "title" => "Ergonomic Wooden Pants",
      "description" => "Deleniti beatae porro.",
      "amount" => 15157,
      "is_gift" => true,
      "quantity" => 1
    }]
    @products_list_without_gift = [{
      "id" => 2,
      "title" => "Ergonomic Wooden Pants",
      "description" => "Deleniti beatae porro.",
      "amount" => 15157,
      "is_gift" => false,
      "quantity" => 1
    }]
  end
  
  describe "#is_black_friday?" do
    it "returns true if date is black_friday_date" do
      expect(is_black_friday?).to be == false   
    end
    it 'returns false if date is not black_friday_date' do
      Timecop.freeze(Date.new(2021,11,27)) do
        expect(is_black_friday?).to be == true   
      end
    end
  end

  describe "#has_gift_product_in_cart?" do 
    it "return true if cart has a gift product" do 
      expect(has_gift_product_in_cart?(@products_list_with_gift)).to be true
    end  
    it "return false if cart does not have a gift product" do 
      expect(has_gift_product_in_cart?(@products_list_without_gift)).to be false
    end  
  end
end

