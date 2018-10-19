require 'rails_helper'

RSpec.describe Order, type: :model do

  context 'Validates' do
    it 'is valid' do
      order = create(:order)
      expect(order).to be_valid
    end
  end

  context 'Validates fields' do
    it { is_expected.to validate_presence_of(:customer) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:table) }
  end

end
