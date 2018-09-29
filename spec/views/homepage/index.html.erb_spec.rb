require 'rails_helper'

RSpec.describe "GET index.html.erb", type: :view do

  it "should redirect to users sign_in page" do
    visit '/'
    expect(page.current_path).to eq '/users/sign_in'
  end

end
