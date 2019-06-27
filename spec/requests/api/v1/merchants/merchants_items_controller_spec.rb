require 'rails_helper'

describe "Merchants items" do
  it "returns a merchants items" do
    merchant = Merchant.create(name: "Bob")
    item_1 = Item.create(name: "baseball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_2 = Item.create(name: "softball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    item_3 = Item.create(name: "golf ball", description: "Rawling", unit_price: 200, merchant_id: merchant.id)
    id = merchant.id
    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end
end
