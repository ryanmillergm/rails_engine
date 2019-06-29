class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(Item.find_by(id: params[:id]).invoice_items)
  end
end
