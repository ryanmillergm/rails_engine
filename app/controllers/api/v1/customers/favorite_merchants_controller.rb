class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Customer.favorite_merchant(customer_params))
  end
end

private

def customer_params
  params.permit(:id, :first_name, :last_name)
end
# "/api/v1/customers/#{customer_id_one}/favorite_merchant"
