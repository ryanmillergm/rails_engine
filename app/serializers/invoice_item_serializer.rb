class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  belongs_to :item
  belongs_to :invoice
  has_many :customers, through: :invoices
  has_many :merchants, through: :invoices
end
