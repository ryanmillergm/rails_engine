require 'rails_helper'

describe "Merchants items" do
  it "returns a merchants items" do
    merchant = Merchant.create(name: "Bob")
    merchant_2 = Merchant.create(name: "Chris")
    item_1 = Item.create(name: "baseball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_2 = Item.create(name: "softball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_3 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_4 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant_2.id)
    id = merchant.id
    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it "returns invoices associated with a merchant from their orders" do

  end

  # GET /api/v1/merchants/:id/invoices returns a collection of
  # invoices associated with that merchant from their known orders
end
