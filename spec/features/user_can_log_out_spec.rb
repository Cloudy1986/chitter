require 'rails_helper'

RSpec.feature 'Log out', type: :feature do
  scenario 'User can log out' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'Log out'
    expect(current_path).to eq '/'
    expect(page).to_not have_content 'Logged in as'
  end
end