require "spec_helper"

require 'rails_helper'

RSpec.describe "categories/index", type: :feature do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
  end

  it "signs me in" do
    visit '/categories/new'
    within("#new_category") do
      fill_in 'Name', with: FFaker::Lorem.word
      fill_in 'Description', with: FFaker::Lorem.phrase
    end
    click_button 'Create'
    expect(page).to have_content 'registered!!'
  end
end
