require "rails_helper"

describe "Merchant Favorite Customer" do
  it "returns merchants favorite customer " do
    merchant = Merchant.create(name: "Bob")
    customer = Customer.create(first_name: "Dan", last_name: "Olsen")
    customer_2 = Customer.create(first_name: "Paul", last_name: "Johnson")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant)
    transaction_1 = Transaction.create(invoice_id: invoice_1.id)
    transaction_2 = Transaction.create(invoice_id: invoice_1.id)
    transaction_3 = Transaction.create(invoice_id: invoice_2.id)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    favorite_customer = JSON.parse(body.response)
    binding.pry
    expect(favorite_customer).to eq(customer)
  end
end
