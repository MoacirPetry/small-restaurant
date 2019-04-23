require 'rails_helper'

RSpec.describe HomepageController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
  end

  describe "GET #index" do
    include_examples :index_examples
  end

  describe "GET #info" do
    it "returns http success" do
      get :info
      expect(response).to have_http_status(:success)
    end
  end
end
