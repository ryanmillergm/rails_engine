require 'rails_helper'

describe "Items API" do

  it "can find item that was sold the most" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    customer_1 = Customer.create(first_name: "Craig", last_name: "Olsen")
    customer_1 = Customer.create(first_name: "Sara", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    merchant_2 = Merchant.create(name: "Paul")
    merchant_3 = Merchant.create(name: "Alex")
    item_1 = Item.create(name: "Baseball", description: "Rawlings", unit_price: 1000, merchant_id: merchant_1.id)
    item_2 = Item.create(name: "Softball", description: "Rawlings", unit_price: 800, merchant_id: merchant_1.id)
    item_3 = Item.create(name: "Golf Ball", description: "Rawlings", unit_price: 500, merchant_id: merchant_2.id)
    item_4 = Item.create(name: "Ping Pong Ball", description: "Rawlings", unit_price: 200, merchant_id: merchant_3.id)
    item_5 = Item.create(name: "Bouncy Ball", description: "Rawlings", unit_price: 100, merchant_id: merchant_3.id)
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_2 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_3 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_2.id, status: "success")
    invoice_4 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_2.id, status: "success")
    invoice_5 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_3.id, status: "success")
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_2.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_2.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_2.id, invoice_id: invoice_2.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_2.id, invoice_id: invoice_3.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_3.id, invoice_id: invoice_3.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_4.id, invoice_id: invoice_3.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_4.id, invoice_id: invoice_4.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_5.id, invoice_id: invoice_5.id, quantity: 2, unit_price: item_1.unit_price)

    get "/api/v1/items/most_items?quantity=2"

    item_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(item_response["data"]["attributes"]["id"]).to eq(item_1.id)
  end
end
