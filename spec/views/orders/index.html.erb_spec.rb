require 'rails_helper'

RSpec.describe "orders/index.html.erb", type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context "GET #index" do
    it "orders list" do
      visit orders_path
      expect(page).to have_content('List of Orders')
    end
    it "new customer" do
      visit orders_path
      expect(page).to have_content('New Order')
    end
  end
end
