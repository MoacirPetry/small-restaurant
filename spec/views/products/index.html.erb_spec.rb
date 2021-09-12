require 'rails_helper'

RSpec.describe 'products/index.html.erb', type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context 'GET #index' do
    it 'product list' do
      visit products_path
      expect(page).to have_content('List of Products')
    end
    it 'new product' do
      visit products_path
      expect(page).to have_content('New Product')
    end
  end
end
