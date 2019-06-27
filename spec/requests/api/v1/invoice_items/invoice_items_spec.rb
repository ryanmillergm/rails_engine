require "rails_helper"

describe "InvoiceItems API" do
  it "returns a list with all invoice_items" do
    customer = Customer.create(first_name: "Dan", last_name: "Olsen")
    customer_2 = Customer.create(first_name: "Paul", last_name: "Johnson")
    merchant = Merchant.create(name: "Bob")
    merchant_2 = Merchant.create(name: "Chris")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)
    invoice_3 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant.id)
    invoice_4 = Invoice.create(customer_id: customer_2.id, merchant_id: merchant_2.id)
    item_1 = Item.create(name: "baseball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_2 = Item.create(name: "softball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_3 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_4 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant_2.id)
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id)
    invoice_item_2 = InvoiceItem.create(item_id: item_2.id, invoice_id: invoice_2.id)
    invoice_item_3 = InvoiceItem.create(item_id: item_3.id, invoice_id: invoice_3.id)
    invoice_item_4 = InvoiceItem.create(item_id: item_4.id, invoice_id: invoice_4.id)

    get "/api/v1/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items["data"].count).to eq(4)
  end

  it "returns invoice_item by id" do
    customer = Customer.create(first_name: "Dan", last_name: "Olsen")
    merchant = Merchant.create(name: "Bob")
    invoice_1 = Invoice.create(customer_id: customer.id, merchant_id: merchant.id)
    item_1 = Item.create(name: "baseball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    invoice_item_1 = InvoiceItem.create(item_id: item_1.id, invoice_id: invoice_1.id)
    id = invoice_item_1.id

    get "/api/v1/invoice_items/#{id}"

    invoice_item_id = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item_id["data"]["id"]).to eq(id.to_s)
  end
end
