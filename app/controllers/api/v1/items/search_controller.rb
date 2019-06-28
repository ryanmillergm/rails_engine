class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.find_all_items(item_params))
  end

  def show
    render json: ItemSerializer.new(Item.find_item(item_params))
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
