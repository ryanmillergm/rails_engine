require 'rails_helper'

describe "Invoices API" do

  xit "can get a invoice by id" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    invoice = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)
    binding.pry
    get "/api/v1/invoices/find?id=#{invoice.id}"
        # "/api/v1/invoices/find?id=#{invoice_find['id']}"
    invoice_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_response["data"]["attributes"]["first_name"]).to eq(invoice.first_name)
  end

  it "can get a invoice by id and return array" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    invoice = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id)

    get "/api/v1/invoices/find_all?customer_id=#{customer_1.id}"
    invoice_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(invoice_response["data"][0]["attributes"]["first_name"]).to eq(invoice.first_name)
    expect(invoice_response["data"].class).to equal(Array)
  end
end
