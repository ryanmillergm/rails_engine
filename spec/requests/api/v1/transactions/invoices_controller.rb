require "rails_helper"

describe "Transactions API" do
  it "can get invoice by transaction id" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    item_1 = Item.create(name: "Baseball", description: "Rawlings", unit_price: 200, merchant_id: merchant_1.id)
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 2, unit_price: item_1.unit_price)
    transaction_1 = Transaction.create(invoice_id: invoice_1.id, credit_card_number: "1234123412341234", credit_card_expiration_date: "12122019", result: "success")

    get "/api/v1/transactions/#{transaction_1.id}/invoice"

    transaction_response = JSON.parse(response.body)
    expect(transaction_response["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end
end
