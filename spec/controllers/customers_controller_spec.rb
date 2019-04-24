require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
    @customer = FactoryBot.create(:customer)
    @invalid_customer =  FactoryBot.attributes_for(:invalid_customer)
  end

  context "GET #index" do
    include_examples :index_examples
  end

  context 'GET #new' do
    include_examples :new_examples
  end

  context 'Checking current_user' do
    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates customer" do
        customer_params = FactoryBot.attributes_for(:customer)
        expect { post :create, params: { :customer => customer_params } }.to change(Customer, :count).by(1)
      end
      it "redirects to the index customers page" do
        post :create, params: { customer: FactoryBot.attributes_for(:customer) }
        expect(response).to redirect_to customers_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new customer" do
        expect{ post :create, params: { :customer => @invalid_customer } }.to_not change(Customer, :count)
      end

      it "renders again to the new method" do
        post :create, params: { :customer => @invalid_customer }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "with valid attributes" do
      it "renders the :edit view" do
        get :edit, params: { :id => @customer }
        expect(response).to render_template(:edit)
      end
      it "returns http success" do
        get :edit, params: { :id => @customer }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "redirects to the updated customers" do
        patch :update, params: { :id => @customer.id, :customer => @customer.attributes } # put to hash, return a hash of an object
        expect(response).to redirect_to customers_path
      end

      it "renders again to the edit method" do
        patch :update, params: { :id => @customer, :customer => @invalid_customer }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the customer" do
      expect{
        delete :destroy, params: { :id => @customer }
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to customers#index" do
      delete :destroy, params: { :id => @customer }
      expect(response).to redirect_to customers_path
    end
  end

end
