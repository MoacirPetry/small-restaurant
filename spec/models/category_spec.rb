require 'rails_helper'

RSpec.describe Category, type: :model do

  context 'Validates' do
    it 'is valid' do
      category = create(:category)
      expect(category).to be_valid
    end
  end

  context 'Validates fields' do
    it "name?" do
      is_expected.to validate_presence_of(:name)
    end
    it "description?" do
      is_expected.to validate_presence_of(:description)
    end
  end
end
