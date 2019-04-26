require 'rails_helper'

RSpec.describe Category, type: :model do

  context 'Validates' do
    it 'is valid' do
      category = create(:category)
      expect(category).to be_valid
    end
  end

  context 'Validates fields' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  context "Associations" do
    it "has_one?" do
      is_expected.to have_one(:product)#have_one(shoulda-matchers) has_one(rails)
    end
  end

end
