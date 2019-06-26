class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoices
  has_many :customers, through: :invoices
  has_many :merchants, through: :invoices
end
