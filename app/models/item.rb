class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoices, through: :merchant

  def self.merchant_items(params)
    Item.where(merchant_id: params[:id])
  end
end
