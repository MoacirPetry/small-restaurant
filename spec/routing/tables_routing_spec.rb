require 'rails_helper'

RSpec.describe TablesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => tables_path).to route_to(:controller => 'tables', :action => 'index')
    end

    it 'routes to #new' do
       expect(:get => new_table_path).to route_to(:controller => 'tables', :action => 'new')
    end

    it 'routes to #edit' do
      expect(:get => edit_table_path(1)).to route_to(:controller => 'tables', :action => 'edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => tables_path).to route_to(:controller => 'tables', :action => 'create')
    end

    it 'routes to #update via PUT' do
      expect(:put => table_path(1)).to route_to(:controller => 'tables', :action => 'update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => table_path(1)).to route_to(:controller => 'tables', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => table_path(1)).to route_to(:controller => 'tables', :action => 'destroy', :id => '1')
    end
  end

  describe 'no routing' do
    it 'routes to #show does not exist' do
      expect(:get => table_path(1)).not_to be_routable
    end
  end
end
