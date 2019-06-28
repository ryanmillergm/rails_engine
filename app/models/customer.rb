class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.favorite_customer(params)
  end

  def self.find_customer(params)
    Customer.find_by(params)
  end

  def self.find_all_customers(params)
    Customer.where(params)
  end
end
