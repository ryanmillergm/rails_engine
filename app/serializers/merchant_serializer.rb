class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
end
