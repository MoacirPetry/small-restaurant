require 'rails_helper'

RSpec.describe "customers/new", type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context "when create" do
    it "valid?" do
      visit new_customer_path
      #find('form', :visible => false).click do
      # within('.btn', :disabled => all) do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Phone Number', with: Faker::Number.number(digits: 10)
      # end
      #find(:xpath, "//input[contains(@name, 'commit')]").click()
      click_button 'Apply'
      expect(page).to have_content 'registered'
    end
  end

  context 'when prohibited' do
    it "!create?" do
      visit new_customer_path
      find(:xpath, "//input[contains(@name, 'commit')]").click()
      expect(page).to have_content('prohibited ')
    end
  end

end
