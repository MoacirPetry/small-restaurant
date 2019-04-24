require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
    @order = FactoryBot.create(:order)
    @invalid_order =  FactoryBot.attributes_for(:invalid_order)
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
      # it "creates order" do
      #   order_params = FactoryBot.attributes_for(:order)
      #   expect { post :create, params: { :order => order_params } }.to change(Order, :count).by(1)
      # end
      # it "redirects to the index orders page" do
      #   post :create, params: { order: FactoryBot.attributes_for(:order) }
      #   expect(response).to redirect_to orders_path
      # end
    end

    context "with invalid attributes" do
      it "does not save the new order" do
        expect{ post :create, params: { :order => @invalid_order } }.to_not change(Order, :count)
      end

      it "renders again to the new method" do
        post :create, params: { :order => @invalid_order }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "with valid attributes" do
      it "renders the :edit view" do
        get :edit, params: { :id => @order }
        expect(response).to render_template(:edit)
      end
      it "returns http success" do
        get :edit, params: { :id => @order }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "redirects to the updated orders" do
        patch :update, params: { :id => @order.id, :order => @order.attributes } # put to hash, return a hash of an object
        expect(response).to redirect_to orders_path
      end

      # it "renders again to the edit method" do
      #   patch :update, params: { :id => @order, :order => @invalid_order }
      #   expect(response).to render_template :edit
      # end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the order" do
      expect{
        delete :destroy, params: { :id => @order }
      }.to change(Order,:count).by(-1)
    end

    it "redirects to orders#index" do
      delete :destroy, params: { :id => @order }
      expect(response).to redirect_to orders_path
    end
  end

end
