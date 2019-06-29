require "rails_helper"

describe "Items API" do
  it "can get merchant by item id" do
    customer_1 = Customer.create(first_name: "Bob", last_name: "Olsen")
    merchant_1 = Merchant.create(name: "Johnny")
    item_1 = Item.create(name: "Baseball", description: "Rawlings", unit_price: 200, merchant_id: merchant_1.id)
    invoice_1 = Invoice.create(customer_id: customer_1.id, merchant_id: merchant_1.id, status: "success")
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_2 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 2, unit_price: item_1.unit_price)
    invoice_item_3 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id, quantity: 2, unit_price: item_1.unit_price)

    get "/api/v1/items/#{item_1.id}/merchant"

    invoice_item_response = JSON.parse(response.body)

    expect(invoice_item_response["data"]["attributes"]["id"]).to eq(merchant_1.id)
  end
end
