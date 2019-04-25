require 'rails_helper'

RSpec.describe "tables/index.html.erb", type: :view do

  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    @table = FactoryBot.create(:table)
    login_as(user, :scope => :user)
  end

  context "GET #index" do
    it "table list" do
      visit tables_path
      expect(page).to have_content('List of Tables')
    end
    it "new table" do
      visit tables_path
      expect(page).to have_content('New Table')
    end
    it "GET #new" do
      visit tables_path
      expect(page).to have_link('New Table', :href => new_table_path)
    end
    it "GET #edit" do
      visit tables_path
      expect(page).to have_link('Edit', :href => edit_table_path(@table))
    end

    it "DELETE #destroy" do
      visit tables_path
      expect(page).to have_link('Delete', :href => table_path(@table))
    end
  end

  describe "invalid link" do
    it "GET #show" do
      visit tables_path
      expect(page).not_to have_link('Show', :href => table_path(@table))
    end
  end

end
