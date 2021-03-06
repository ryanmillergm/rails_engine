class Api::V1::Customers::CustomerInvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Customer.joins(:invoices).find(params[:id]).invoices)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
