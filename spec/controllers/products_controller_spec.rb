require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
    @product = FactoryBot.create(:product)
    @invalid_product =  FactoryBot.attributes_for(:invalid_product)
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
      # it "creates product" do
      #   product_params = FactoryBot.attributes_for(:product)
      #   expect { post :create, params: { :product => product_params } }.to change(Product, :count).by(1)
      # end
      # it "redirects to the index products page" do
      #   post :create, params: { product: FactoryBot.attributes_for(:product) }
      #   expect(response).to redirect_to products_path
      # end
    end

    context "with invalid attributes" do
      it "does not save the new product" do
        expect{ post :create, params: { :product => @invalid_product } }.to_not change(Product,:count)
      end

      it "renders again to the new method" do
        post :create, params: { :product => @invalid_product }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "with valid attributes" do
      it "renders the :edit view" do
        get :edit, params: { :id => @product }
        expect(response).to render_template(:edit)
      end
      it "returns http success" do
        get :edit, params: { :id => @product }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "redirects to the updated products" do
        patch :update, params: { :id => @product.id, :product => @product.attributes } # put to hash, return a hash of an object
        expect(response).to redirect_to products_path
      end

      it "renders again to the edit method" do
        patch :update, params: { :id => @product, :product => @invalid_product }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the product" do
      expect{
        delete :destroy, params: { :id => @product }
      }.to change(Product,:count).by(-1)
    end

    it "redirects to products#index" do
      delete :destroy, params: { :id => @product }
      expect(response).to redirect_to products_path
    end
  end

end
