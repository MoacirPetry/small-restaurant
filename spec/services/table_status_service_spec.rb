require 'rails_helper'

RSpec.describe TableStatusService, type: :model do

  describe '#call' do
    let(:table) { FactoryBot.create(:table) }
    it 'change_status_to_true' do
      response = TableStatusService.change_status_to_true(table.id)
      expect(response).to be(true)
    end
    it 'change_status_to_false' do
      response = TableStatusService.change_status_to_false(table.id)
      expect(response).to be(true)
    end
  end
end
