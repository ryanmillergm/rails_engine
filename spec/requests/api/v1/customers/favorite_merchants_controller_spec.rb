require 'rails_helper'

describe "Customers API" do

  it "can favorite merchant by customer id" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    merchant_2 = Merchant.create(name: "Paul")
    merchant_3 = Merchant.create(name: "Alex")
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_2 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_2.id, status: "success")
    invoice_3 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_2.id, status: "success")
    invoice_4 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_2.id, status: "success")
    invoice_5 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_3.id, status: "success")
    invoice_6 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_3.id, status: "success")
    transaction_1 = Transaction.create(invoice_id: invoice_1.id, credit_card_number: "3242", result: "success")
    transaction_2 = Transaction.create(invoice_id: invoice_2.id, credit_card_number: "3242", result: "success")
    transaction_3 = Transaction.create(invoice_id: invoice_3.id, credit_card_number: "3242", result: "success")
    transaction_4 = Transaction.create(invoice_id: invoice_4.id, credit_card_number: "3242", result: "success")
    transaction_5 = Transaction.create(invoice_id: invoice_5.id, credit_card_number: "3242", result: "success")
    transaction_6 = Transaction.create(invoice_id: invoice_6.id, credit_card_number: "3242", result: "success")


    get "/api/v1/customers/#{customer_1.id}/favorite_merchant"

    invoice_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(invoice_response["data"]["attributes"]["id"]).to eq(merchant_2.id)
  end
end
