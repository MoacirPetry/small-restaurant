require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Test New User View' do
    it 'Create a new user' do
      users = User.all
      size_old = users.size
      visit '/users/sign_up'
      within('#new_user') do
        fill_in 'Email', with: 'jason@usa.com'
        fill_in 'Password', with: 'jason@usa.com'
        fill_in 'Password confirmation', with: 'jason@usa.com'
      end
      click_button 'Sign up'
      expect(page).to have_content 'successfully'
      users = User.all
      expect(users.size).to eql(size_old +1)
    end
  end

  context 'Associations' do
    it 'have_many?' do
      is_expected.to have_many(:orders)
    end
  end

end
