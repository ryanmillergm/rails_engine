class Api::V1::Merchants::MerchantItemsController < ApplicationController
  def index
    # render json: Merchant.joins(:items).where(merchant_item_params)
    render json: Item.merchant_items(merchant_item_params)
    # render json: Item.where(merchant_id: merchant_item_params[:id])

  end

  private

  def merchant_item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id)
  end

end
