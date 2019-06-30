class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchant(params)
     Merchant.joins(:invoices)
             .where(invoices: {customer_id: params[:id]})
             .joins(:transactions)
             .where(transactions: {result: 'success'})
             .select("merchants.*, COUNT(transactions.id) AS transactions_count")
             .group(:id)
             .order("transactions_count DESC")
             .first
  end



  def self.find_customer(params)
    Customer.find_by(params)
  end

  def self.find_all_customers(params)
    Customer.where(params)
  end
end
