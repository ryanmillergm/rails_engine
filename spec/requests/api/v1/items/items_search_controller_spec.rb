require 'rails_helper'

describe "Items API" do

  it "can get a item by id" do
    merchant_1 = Merchant.create(name: "Johnny")
    item = Item.create(name: "Baseball", description: "Rawling", unit_price: 200, merchant_id: merchant_1.id)

    get "/api/v1/items/find?id=#{item.id}"
        # "/api/v1/items/find?id=#{item_find['id']}"
    item_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item_response["data"]["id"]).to eq(item.id.to_s)
  end

  it "can get a item by merchant id" do
    merchant_1 = Merchant.create(name: "Johnny")
    item = Item.create(name: "Baseball", description: "Rawling", unit_price: 200, merchant_id: merchant_1.id)

    get "/api/v1/items/find_all?merchant_id=#{merchant_1.id}"
    item_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(item_response["data"][0]["relationships"]["merchant"]["data"]["id"]).to eq(merchant_1.id.to_s)
    expect(item_response["data"].class).to equal(Array)
  end
end
