require "spec_helper"

require 'rails_helper'

RSpec.describe "categories/index", type: :view do

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  context "GET #index" do
    it "categories list" do
      visit categories_path
      expect(page).to have_content('List of Categories')
    end
    it "new category" do
      visit categories_path
      expect(page).to have_content('New Category')
    end
  end
end
