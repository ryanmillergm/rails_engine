require 'rails_helper'

describe "Merchant API" do
  it "sends a list of merchants" do
     create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body)
   end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
  end

  it "can get one merchant by name" do
    merchant = Merchant.create(name: "Bob")

    get "/api/v1/merchants/find?name=Bob"
    merchant_response = JSON.parse(response.body)

    expect(response).to be_successful
    binding.pry
    expect(merchant_response["name"]).to eq(merchant.name)
  end

  xit "can create an item" do
    item_params = {name: "Saw", description: "I want to play a game"}

    post "/api/v1/items", params: {item: item_params}

    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  xit "can update" do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = { name: "Snakebite"}

    put "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Snakebite")
  end

  xit "can destroy an item" do
    item = create(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
