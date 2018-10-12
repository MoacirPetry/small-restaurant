require 'rails_helper'

RSpec.describe "tables/index.html.erb", type: :view do

  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    @table = FactoryBot.create(:table)
    login_as(user, :scope => :user)
  end

  describe "checking TAG's content..." do
    it "H1 content" do
      visit tables_path
      expect(page).to have_content("List of Tables")
    end
  end

  describe "checking links..." do
    it "GET #new" do
      visit tables_path
      expect(page).to have_link('', :href => new_table_path)
    end

    # it "GET #edit" do
    #   visit tables_path
    #   expect(page).to have_link(:href => edit_table_path(@table), :visible => all)
    # end
    #
    # it "DELETE #destroy" do
    #   visit tables_path
    #   expect(page).to have_link('Delete', :href => table_path)
    # end
  end

  describe "checking invalid link..." do
    it "GET #show" do
      visit tables_path
      expect(page).not_to have_link('Show', :href => "/tables/1")
    end
  end

end
