require 'rails_helper'

RSpec.describe ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => products_path).to route_to(:controller => 'products', :action => 'index')
    end

    it 'routes to #new' do
       expect(:get => new_product_path).to route_to(:controller => 'products', :action => 'new')
    end

    it 'routes to #edit' do
      expect(:get => edit_product_path(1)).to route_to(:controller => 'products', :action => 'edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => products_path).to route_to(:controller => 'products', :action => 'create')
    end

    it 'routes to #update via PUT' do
      expect(:put => product_path(1)).to route_to(:controller => 'products', :action => 'update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => product_path(1)).to route_to(:controller => 'products', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => product_path(1)).to route_to(:controller => 'products', :action => 'destroy', :id => '1')
    end
  end

  describe 'no routing' do
    it 'routes to #show does not exist' do
      expect(:get => product_path(1)).not_to be_routable
    end
  end
end
