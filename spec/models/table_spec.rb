require 'rails_helper'

RSpec.describe Table, type: :model do

  context 'Validates' do
    it 'is valid' do
      table = create(:table)
      expect(table).to be_valid
    end
  end

  context 'Validates fields' do
    #it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:limit) }
  end

end
