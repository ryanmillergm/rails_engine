require 'rails_helper'

describe "Merchants API" do

  it "can get a merchant by name" do
    merchant = Merchant.create(name: "Bob")

    get "/api/v1/merchants/find?name=Bob"
    merchant_response = JSON.parse(response.body)

    expect(response).to be_successful
    binding.pry
    expect(merchant_response["name"]).to eq(merchant.name)
  end

  it "can get "
end

# GET /api/v1/merchants/find_all?parameters
