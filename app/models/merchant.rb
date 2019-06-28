class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.find_merchant(params)
    Merchant.find_by(params)
  end

  def self.find_all_merchants(params)
    Merchant.where(params)
  end
end
