require 'rails_helper'

RSpec.describe Order, type: :model do

  context 'Validates' do
    it 'is valid' do
      order = create(:order)
      expect(order).to be_valid
    end
  end

  context 'Validates fields' do
    it 'customer?' do
      is_expected.to validate_presence_of(:customer)
    end
    it 'user?' do
      is_expected.to validate_presence_of(:user)
    end
    it 'table?' do
      is_expected.to validate_presence_of(:table)
    end
  end

  context 'Associations' do
    it 'belong_to?' do
      is_expected.to belong_to(:customer)
      is_expected.to belong_to(:user)
      is_expected.to belong_to(:table)
    end
    it 'has_many?' do
      is_expected.to have_many(:order_products)
    end
    it 'accepts_nested_attributes_for?' do
      is_expected.to accept_nested_attributes_for(:order_products)
    end
  end

  describe 'total_order' do
    context 'given an empty order' do
      it 'returns 0' do
        order = create(:order)
        expect(order.total_order(order)).to eq(0)
      end
    end
    context 'given products' do
      it 'returns total' do
        order = create(:order, :with_products)
        response = order.total
        expect(response).not_to eq(0)
      end
    end
  end
end
