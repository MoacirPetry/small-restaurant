require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'Validates' do
    it 'is valid' do
      product = create(:product)
      expect(product).to be_valid
    end
  end

  context 'Validates fields' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'Associations' do
    it 'belong_to?' do
      is_expected.to belong_to(:category)
    end
  end

end
