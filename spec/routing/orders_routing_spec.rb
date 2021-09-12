require 'rails_helper'

RSpec.describe OrdersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => orders_path).to route_to(:controller => 'orders', :action => 'index')
    end

    it 'routes to #show' do
      expect(:get => order_path(1)).to be_routable
    end

    it 'routes to #new' do
       expect(:get => new_order_path).to route_to(:controller => 'orders', :action => 'new')
    end

    it 'routes to #edit' do
      expect(:get => edit_order_path(1)).to route_to(:controller => 'orders', :action => 'edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => orders_path).to route_to(:controller => 'orders', :action => 'create')
    end

    it 'routes to #update via PUT' do
      expect(:put => order_path(1)).to route_to(:controller => 'orders', :action => 'update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => order_path(1)).to route_to(:controller => 'orders', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => order_path(1)).to route_to(:controller => 'orders', :action => 'destroy', :id => '1')
    end
  end

end
