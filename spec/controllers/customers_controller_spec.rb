require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
  end

  context "GET #index" do
    include_examples :index_examples
  end

  context 'GET #new' do
    it "render the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context 'Checking current_user' do
    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end
  end

end
