class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.merchant_items(params)
    Item.where(merchant_id: params[:id])
  end

  def self.find_item(params)
    Item.find_by(params)
    # Item.where(params).order(id: :asc)
  end

  def self.find_all_items(params)
    Item.where(params)
  end

  def self.most_sold(limit)
    Item.joins(:invoice_items)
        .joins(:invoices)
        .where(invoices: {status: 'shipped'})
        .select('items.*, COUNT(items.id) as items_count')
        .group(:id)
        .order('items_count DESC')
        .limit(limit)
  end

  def self.best_day(params)
    binding.pry
    Invoice.joins(:invoice_items)
    .where(invoice_items: {item_id: params})
    .select('SUM(invoice_items.quantity) AS item_sum, invoices.*')
    .group('invoices.id').order('item_sum DESC')
    .order('invoices.created_at DESC')
  end
end
