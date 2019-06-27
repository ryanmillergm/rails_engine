require 'rails_helper'

describe "Merchants invoices" do
  it "returns a merchants invoices" do
    customer_1 = Customer.create(first_name: "Paul", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Bob")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)
    invoice_2 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)
    invoice_3 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)
    invoice_4 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)
    id = merchant_1.id

    get "/api/v1/merchants/#{id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(4)
  end

  it "returns invoices associated with a merchant from their orders" do

  end
# GET /api/v1/merchants/:id/invoices returns a collection of invoices
# associated with that merchant from their known orders
end
