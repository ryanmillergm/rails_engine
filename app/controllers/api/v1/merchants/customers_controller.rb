class Api::V1::Merchants::CustomersController < ApplicationController
  def show
    # merchant = Merchant.find(params[:id])
    # favorite_customer(merchant)
    render json: CustomerSerializer.new(Customer.favorite_customer(params[:id]))
  end
end
