require "rails_helper"

RSpec.describe CustomersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => customers_path).to route_to(:controller => "customers", :action => "index")
    end

    it "routes to #new" do
       expect(:get => new_customer_path).to route_to(:controller => "customers", :action => "new")
    end

    it "routes to #edit" do
      expect(:get => edit_customer_path(1)).to route_to(:controller => "customers", :action => "edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => customers_path).to route_to(:controller => "customers", :action => "create")
    end

    it "routes to #update via PUT" do
      expect(:put => customer_path(1)).to route_to(:controller => "customers", :action => "update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => customer_path(1)).to route_to(:controller => "customers", :action => "update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => customer_path(1)).to route_to(:controller => "customers", :action => "destroy", :id => "1")
    end
  end

  describe "no routing" do
    it "routes to #show does not exist" do
      expect(:get => customer_path(1)).not_to be_routable
    end
  end
end
