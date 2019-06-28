class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  attribute :unit_price do |currency|
    "#{'%.2f' % (currency.unit_price * 1/100.to_f)}"
  end
end
