class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.merchant_items(params)
    Item.where(merchant_id: params[:id])
  end
end
