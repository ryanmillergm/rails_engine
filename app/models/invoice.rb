class Invoice < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.most_revenue(limit = 5)
    select()
    .limit(limit)
    .merge(Transaction.successful)
  end

  def self.merchant_invoices(params)
    Invoice.where(merchant_id: params.to_i)
  end

  def self.find_all_invoices(params)
    Invoice.where(params).order(id: :asc)
  end

  def self.find_invoice(params)
    Invoice.find_by(params)
  end
end
