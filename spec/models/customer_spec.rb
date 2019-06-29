require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe "relationship" do
    it { should have_many :invoices }
    it { should have_many :transactions }
    it { should have_many :merchants }
  end
end
