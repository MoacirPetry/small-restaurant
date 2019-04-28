require "spec_helper"

require 'rails_helper'

RSpec.describe "categories/new", type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context "when create" do
    it "valid?" do
      visit new_category_path
      #find('form', :visible => false).click do
      # within('.btn', :disabled => all) do
      fill_in 'Name', :with => Faker::Lorem.word
      fill_in 'Description', :with => Faker::Lorem.sentence
      # end
      #find(:xpath, "//input[contains(@name, 'commit')]").click()
      click_button 'Apply'
      expect(page).to have_content 'registered'
    end
  end

  context 'when prohibited' do
    it "!create?" do
      visit new_category_path
      find(:xpath, "//input[contains(@name, 'commit')]").click()
      expect(page).to have_content('prohibited ')
    end
  end
end
