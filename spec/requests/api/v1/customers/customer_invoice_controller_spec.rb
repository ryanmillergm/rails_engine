require "rails_helper"

describe "customer relationships to invoices" do
  it "can find all invoices for one specific customer" do
    customer_1 = Customer.create(first_name: "Chris", last_name: "Johnson")
    merchant_1 = Merchant.create(name: "John")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_2 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_3 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")

    get "/api/v1/customers/#{customer_1.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices["data"].count).to eq(3)
  end
end
