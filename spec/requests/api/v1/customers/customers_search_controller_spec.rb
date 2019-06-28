require 'rails_helper'

describe "Customers API" do

  it "can get a customer by name" do
    customer = Customer.create(first_name: "Bob", last_name: "Olsen")
    get "/api/v1/customers/find?first_name=Bob"
    customer_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer_response["data"]["attributes"]["first_name"]).to eq(customer.first_name)
  end

  it "can get a customer by name and return array" do
    customer = Customer.create(first_name: "Bob", last_name: "Olsen")

    get "/api/v1/customers/find_all?first_name=Bob"
    customer_response = JSON.parse(response.body)

    expect(response).to be_successful

    expect(customer_response["data"][0]["attributes"]["first_name"]).to eq(customer.first_name)
    expect(customer_response["data"].class).to equal(Array)
  end
end
