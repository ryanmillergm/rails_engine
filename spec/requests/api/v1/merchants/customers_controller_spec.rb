require "rails_helper"

describe "Merchant Favorite Customer" do
  it "returns merchants favorite customer " do
    merchant = Merchant.create(name: "Bob")
    customer = Customer.create(first_name: "Dan", last_name: "Olsen")
    customer_2 = Customer.create(first_name: "Paul", last_name: "Johnson")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)
    transaction_1 = Transaction.create(invoice_id: invoice_1.id, result: "success")
    transaction_2 = Transaction.create(invoice_id: invoice_1.id, result: "success")
    transaction_3 = Transaction.create(invoice_id: invoice_2.id, result: "success")

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    favorite_customer = JSON.parse(response.body)
    binding.pry
    expect(favorite_customer).to eq(customer)
  end
end
