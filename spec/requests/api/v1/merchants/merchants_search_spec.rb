require 'rails_helper'

describe "Merchants API" do

  it "can get a merchant by name" do
    merchant = Merchant.create(name: "Bob")

    get "/api/v1/merchants/find?name=Bob"
    merchant_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant_response["name"]).to eq(merchant.name)
  end

  it "can get a merchant by name and return array" do
    merchant = Merchant.create(name: "Bob")

    get "/api/v1/merchants/find_all?name=Bob"
    merchant_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant_response[0]["name"]).to eq(merchant.name)
    expect(merchant_response.class).to equal(Array)
  end
end
