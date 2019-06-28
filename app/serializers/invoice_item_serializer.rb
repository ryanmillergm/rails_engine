class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price
  belongs_to :item
  belongs_to :invoice

  attribute :unit_price do |currency|
    num = currency.unit_price
    num = num * (1/100.to_f)
    # "#{currency.unit_price = currency.unit_price * (1/100.to_f)}"
    "#{currency.unit_price = num}"
  end

end
