class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result

  belongs_to :invoice
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoices
  has_many :customers, through: :invoices
  has_many :merchants, through: :invoices
end
