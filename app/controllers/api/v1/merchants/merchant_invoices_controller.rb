class Api::V1::Merchants::MerchantInvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(merchant_invoices(params[:id]))
  end
end
