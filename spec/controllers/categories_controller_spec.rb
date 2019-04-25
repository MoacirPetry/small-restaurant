require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
    @category = FactoryBot.create(:category)
    @invalid_category =  FactoryBot.attributes_for(:invalid_category)
  end

  context "Check current_user" do
    include_examples :current_user_examples
  end

  context "GET #index" do
    include_examples :index_examples
  end

  context 'GET #new' do
    include_examples :new_examples
  end

  describe "POST #create" do
    # context "with valid attributes" do
    #   it "creates category" do
    #     categories_params = FactoryBot.attributes_for(:category)
    #     expect { post :create, params: { :category => categories_params } }.to change(Category, :count).by(1)
    #   end
    #   it "redirects to the index categories page" do
    #     post :create, params: { category: FactoryBot.attributes_for(:category) }
    #     expect(response).to redirect_to categories_path
    #   end
    # end

    context "with invalid attributes" do
      it "does not save the new category" do
        expect{ post :create, params: { :category => @invalid_category } }.to_not change(Category, :count)
      end

      it "renders again to the new method" do
        post :create, params: { :category => @invalid_category }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "with valid attributes" do
      it "renders the :edit view" do
        get :edit, params: { :id => @category }
        expect(response).to render_template(:edit)
      end
      it "returns http success" do
        get :edit, params: { :id => @category }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "redirects to the updated categories" do
        patch :update, params: { :id => @category.id, :category => @category.attributes } # put to hash, return a hash of an object
        expect(response).to redirect_to categories_path
      end

      it "renders again to the edit method" do
        patch :update, params: { :id => @category, :category => @invalid_category }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the category" do
      expect{
        delete :destroy, params: { :id => @category }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to categories#index" do
      delete :destroy, params: { :id => @category }
      expect(response).to redirect_to categories_path
    end
  end

end
