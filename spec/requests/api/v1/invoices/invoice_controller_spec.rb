require "rails_helper"

describe "Invoice API" do
  it "returns a list of all invoices" do
    merchant = Merchant.create(name: "Bob")
    customer = Customer.create(first_name: "Dan", last_name: "Olsen")
    customer_2 = Customer.create(first_name: "Paul", last_name: "Johnson")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)
    invoice_3 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)

    get "/api/v1/invoices"

    invoices = JSON.parse(response.body)

    expect(invoices["data"].count).to eq(3)
  end
end
