require 'rails_helper'

RSpec.describe OrderProduct, type: :model do

  context 'Validates' do
    it 'is valid' do
      order_product = create(:order_product)
      expect(order_product).to be_valid
    end
  end

  context 'Validates fields' do
    it { is_expected.to validate_presence_of(:order) }
    it { is_expected.to validate_presence_of(:product) }
  end

end
