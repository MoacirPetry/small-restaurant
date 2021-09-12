require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => categories_path).to route_to(:controller => 'categories', :action => 'index')
    end

    it 'routes to #new' do
       expect(:get => new_category_path).to route_to(:controller => 'categories', :action => 'new')
    end

    it 'routes to #edit' do
      expect(:get => edit_category_path(1)).to route_to(:controller => 'categories', :action => 'edit', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => categories_path).to route_to(:controller => 'categories', :action => 'create')
    end

    it 'routes to #update via PUT' do
      expect(:put => category_path(1)).to route_to(:controller => 'categories', :action => 'update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => category_path(1)).to route_to(:controller => 'categories', :action => 'update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => category_path(1)).to route_to(:controller => 'categories', :action => 'destroy', :id => '1')
    end
  end

  describe 'no routing' do
    it 'routes to #show does not exist' do
      expect(:get => category_path(1)).not_to be_routable
    end
  end
end
