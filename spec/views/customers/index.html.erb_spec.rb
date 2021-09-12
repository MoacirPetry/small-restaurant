require 'rails_helper'

RSpec.describe 'customers/index.html.erb', type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context 'GET #index' do
    it 'customers list' do
      visit customers_path
      expect(page).to have_content('List of Customers')
    end
    it 'new customer' do
      visit customers_path
      expect(page).to have_content('New Customer')
    end
  end
end
