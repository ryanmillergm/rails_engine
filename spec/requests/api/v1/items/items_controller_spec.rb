require "rails_helper"

describe "Items API" do
  it "returns a list of all Items" do
    merchant = Merchant.create(name: "Bob")
    item_1 = Item.create(name: "Baseball", description: "Rawlings", unit_price: 200, merchant_id: merchant.id)
    item_2 = Item.create(name: "Softball", description: "Rawlings", unit_price: 200, merchant_id: merchant.id)
    item_3 = Item.create(name: "Golf all", description: "Rawlings", unit_price: 200, merchant_id: merchant.id)

    get "/api/v1/items"

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items["data"].count).to eq(3)
  end
end
