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
end
