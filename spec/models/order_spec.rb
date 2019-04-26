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

  context 'Associations' do
    it "belong_to?" do
      is_expected.to belong_to(:customer)
      is_expected.to belong_to(:user)
      is_expected.to belong_to(:table)
    end
    it "has_many?" do
      is_expected.to have_many(:order_products)#have_many(shoulda-matchers) has_many(rails)
    end
    it "accepts_nested_attributes_for?" do
      is_expected.to accept_nested_attributes_for(:order_products)#accept_nested_attributes_for(shoulda-matchers) accepts_nested_attributes_for(rails)
    end
  end

end
