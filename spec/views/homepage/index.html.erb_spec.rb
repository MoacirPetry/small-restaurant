require 'rails_helper'

RSpec.describe "GET Homepage links", type: :view do

  let(:homepage) { visit root_path }
  let(:orders) { visit orders_path }
  let(:tables) { visit tables_path }
  let(:categories) { visit categories_path }
  let(:products) { visit products_path }
  let(:customers) { visit customers_path }
  let(:user) { visit edit_user_registration_path }

  before(:each) do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
  end

  describe "homepage" do
    it "#index" do
      homepage
      expect(response).to render_template(:index)
    end
    it "path" do
      homepage
      expect(page.current_path).to eq '/'
    end
  end

  describe "orders" do
    it "#index" do
      orders
      expect(response).to render_template(:index)
    end
    it "path" do
      orders
      expect(page.current_path).to eq '/orders'
    end
  end

  describe "tables" do
    it "#index" do
      tables
      expect(response).to render_template(:index)
    end
    it "path" do
      tables
      expect(page.current_path).to eq '/tables'
    end
  end

  describe "categories" do
    it "#index" do
      categories
      expect(response).to render_template(:index)
    end
    it "path" do
      categories
      expect(page.current_path).to eq '/categories'
    end
  end

  describe "products" do
    it "#index" do
      products
      expect(response).to render_template(:index)
    end
    it "path" do
      products
      expect(page.current_path).to eq '/products'
    end
  end

  describe "customers" do
    it "#index" do
      customers
      expect(response).to render_template(:index)
    end
    it "path" do
      customers
      expect(page.current_path).to eq '/customers'
    end
  end

  describe "user" do
    it "#edit" do
      user
      expect(response).to render_template(:edit)
    end
    it "path" do
      user
      expect(page.current_path).to eq '/users/edit'
    end
  end


end
