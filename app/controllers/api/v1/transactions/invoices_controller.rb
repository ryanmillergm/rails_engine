class Api::V1::Transactions::InvoicesController < ApplicationController
  def show
    binding.pry
    render json: InvoiceSerializer.new(Transaction.find_by(id: params[:id]).invoice)
  end
end
