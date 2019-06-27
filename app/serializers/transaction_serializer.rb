class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result

  belongs_to :invoice
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoice
  has_many :customers, through: :invoice
  has_many :merchants, through: :invoice
end
