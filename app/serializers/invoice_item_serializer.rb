class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price
  belongs_to :item
  belongs_to :invoice

  attribute :unit_price do |currency|
    "#{'%.2f' % (currency.unit_price * 1/100.to_f)}"
  end

end
