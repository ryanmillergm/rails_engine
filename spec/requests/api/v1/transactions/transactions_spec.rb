require "rails_helper"

describe "Transactions API" do
  it "returns a list of all transactions" do
    customer = Customer.create(first_name: "Dan", last_name: "Olsen")
    customer_2 = Customer.create(first_name: "Paul", last_name: "Johnson")
    merchant = Merchant.create(name: "Bob")
    merchant_2 = Merchant.create(name: "Chris")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)
    invoice_3 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)
    invoice_4 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant_2.id)
    invoice_5 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant_2.id)
    item_1 = Item.create(name: "baseball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_2 = Item.create(name: "softball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_3 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_4 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant_2.id)
    transaction_1 = Transaction.create(invoice_id: invoice_1.id, credit_card_number: "23432343234232234", credit_card_expiration_date: "01102020", result: "success")
    transaction_2 = Transaction.create(invoice_id: invoice_2.id, credit_card_number: "23432343234232234", credit_card_expiration_date: "01102020", result: "success")
    transaction_3 = Transaction.create(invoice_id: invoice_3.id, credit_card_number: "23432343234232234", credit_card_expiration_date: "01102020", result: "success")
    transaction_4 = Transaction.create(invoice_id: invoice_4.id, credit_card_number: "23432343234232234", credit_card_expiration_date: "01102020", result: "success")
    transaction_5 = Transaction.create(invoice_id: invoice_5.id, credit_card_number: "23432343234232234", credit_card_expiration_date: "01102020", result: "success")

    get "/api/v1/transactions"
    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(5)
  end
end
