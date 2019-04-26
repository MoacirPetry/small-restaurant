require 'rails_helper'

RSpec.describe Order, type: :model do

  context 'Validates' do
    it 'is valid' do
      order = create(:order)
      expect(order).to be_valid
    end
  end

  context 'Validates fields' do
    it "customer?" do
      is_expected.to validate_presence_of(:customer)
    end
    it "user?" do
      is_expected.to validate_presence_of(:user)
    end
    it "table?" do
      is_expected.to validate_presence_of(:table)
    end
  end

end
