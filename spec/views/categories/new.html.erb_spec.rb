require "spec_helper"

require 'rails_helper'

RSpec.describe "categories/new", type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context "Test New Category" do
    it "Create a new category" do
      visit new_category_path
      #find('form', :visible => false).click do
      # within('.btn', :disabled => all) do
      fill_in 'Name', :with => FFaker::Lorem.word
      fill_in 'Description', :with => FFaker::Lorem.phrase
      # end
      #find(:xpath, "//input[contains(@name, 'commit')]").click()
      click_button 'Create'
      expect(page).to have_content 'registered'
    end
  end

  context 'pro' do
    it "dont permit Create a new category" do
      visit new_category_path
      find(:xpath, "//input[contains(@name, 'commit')]").click()
      expect(page).to have_content('prohibited ')
    end
  end
end
