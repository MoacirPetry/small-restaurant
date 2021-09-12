require 'rails_helper'

RSpec.describe TablesController, type: :controller do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user) # Using factory bot as an example
    @table = FactoryBot.create(:table)
    @invalid_table =  FactoryBot.attributes_for(:invalid_table)
  end

  context 'Check current_user' do
    include_examples :current_user_examples
  end

  describe 'GET #index' do
    include_examples :index_examples
  end

  context 'GET #new' do
    include_examples :new_examples
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates table' do
        table_params = FactoryBot.attributes_for(:table)
        expect { post :create, params: { :table => table_params } }.to change(Table, :count).by(1)
      end
      it 'redirects to the index tables page' do
        post :create, params: { table: FactoryBot.attributes_for(:table) }
        expect(response).to redirect_to tables_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new table' do
        expect{ post :create, params: { :table => @invalid_table } }.to_not change(Table,:count)
      end

      it 'renders again to the new method' do
        post :create, params: { :table => @invalid_table }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    context 'with valid attributes' do
      it 'renders the :edit view' do
        get :edit, params: { :id => @table }
        expect(response).to render_template(:edit)
      end
      it 'returns http success' do
        get :edit, params: { :id => @table }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'redirects to the updated tables' do
        patch :update, params: { :id => @table.id, :table => @table.attributes } # put to hash, return a hash of an object
        expect(response).to redirect_to tables_path
      end

      it 'renders again to the edit method' do
        patch :update, params: { :id => @table, :table => @invalid_table }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the table' do
      expect{
        delete :destroy, params: { :id => @table }
      }.to change(Table,:count).by(-1)
    end

    it 'redirects to tables#index' do
      delete :destroy, params: { :id => @table }
      expect(response).to redirect_to tables_path
    end
  end

end
