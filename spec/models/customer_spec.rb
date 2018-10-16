require 'rails_helper'

RSpec.describe Customer, type: :model do

  context 'Validates' do
    it 'is valid' do
      customer = create(:customer)
      expect(customer).to be_valid
    end
  end

  context 'Validates fields' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

end
