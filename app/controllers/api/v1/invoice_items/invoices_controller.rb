class Api::V1::InvoiceItems::InvoicesController < ApplicationController
  def show
    show = render json: InvoiceSerializer.new(InvoiceItem.find_by(id: params[:id]).invoice)
  end
end
