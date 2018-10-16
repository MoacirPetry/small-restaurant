require 'rails_helper'

RSpec.describe "customers/new", type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context 'GET #new' do
    it "expect #new" do
      visit customers_path
      # click_on('New Customer')
      expect(page).to have_content('New Customer')
    end
  end

end
