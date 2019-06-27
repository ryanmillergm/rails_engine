class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :customers, through: :invoice
  has_many :merchants, through: :invoice
end
