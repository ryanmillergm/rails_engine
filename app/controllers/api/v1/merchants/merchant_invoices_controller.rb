class Api::V1::Merchants::MerchantInvoicesController < ApplicationController
  def index
    render json: Invoice.merchant_invoices(params[:id])
  end
end
