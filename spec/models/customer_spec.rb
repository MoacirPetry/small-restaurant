require 'rails_helper'

RSpec.describe Customer, type: :model do

  context 'Validates' do
    it 'is valid' do
      customer = create(:customer)
      expect(customer).to be_valid
    end
  end

  context 'Validates fields' do
    it "name?" do
      is_expected.to validate_presence_of(:name)
    end
    it 'description?' do
      is_expected.to validate_presence_of(:email)
    end
    it 'phone_number?' do
      is_expected.to validate_presence_of(:phone_number)
    end
  end

  context 'Associations' do
    it 'has_one?' do
      is_expected.to have_one(:order)
    end
  end

end
