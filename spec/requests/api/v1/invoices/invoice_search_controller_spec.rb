require 'rails_helper'

describe "Invoices API" do

  it "can get a invoice by id" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    invoice = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)

    get "/api/v1/invoices/find?id=#{invoice.id}"
        # "/api/v1/invoices/find?id=#{invoice_find['id']}"
    invoice_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_response["data"]["id"]).to eq(invoice.id.to_s)
  end

  it "can get a invoice by customer id" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    invoice = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)

    get "/api/v1/invoices/find_all?customer_id=#{customer_1.id}"
    invoice_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(invoice_response["data"][0]["relationships"]["customer"]["data"]["id"]).to eq(customer_1.id.to_s)
    expect(invoice_response["data"].class).to equal(Array)
  end
end
