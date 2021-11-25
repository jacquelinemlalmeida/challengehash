
	class Api::V1::MarketCarsController < ActionController::API

		include ProductsHelper
		include OrderHelper
		include ValidatesHelper

		def checkpoint 
			
			if params["products"].nil?
				render json: {status: 'Car Without Products', message: "Não é possível fazer checkout com carrinho vazio."}, status: :bad_request
			else 
				products = load_products_by_ids(params["products"]) 
				
				if has_gift_product_in_cart?(products)	
					render json: {status: 'Gift Product', message: "Produto brinde não pode ser adquirido."}, status: :bad_request
				else
					order_with_discount = calculate_products_discount(products)
					
					if is_black_friday?
						order_with_gift = add_gift_to_order(order_with_discount)
						render json: create_order_response(order_with_gift), status: :ok
					else
						render json: create_order_response(order_with_discount), status: :ok
					end
				end
			end
		end
	end
