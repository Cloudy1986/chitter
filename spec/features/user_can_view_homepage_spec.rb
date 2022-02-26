require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario 'user can view homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'logged in user cannot see sign up or log in buttons' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/log-in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    visit '/'
    expect(page).to_not have_button 'Sign up'
    expect(page).to_not have_button 'Log in'
  end

  scenario 'logged out user cannot see add peep link' do
    visit '/'
    expect(page).to_not have_link 'Add new peep'
  end
end
