class Api::V1::Merchants::SearchController < ApplicationController

  def index
    binding.pry
  end

  def show
    render json: Merchant.find_by(name: params[:name])
  end
end
