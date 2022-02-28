require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'User can sign up' do
    user = User.create(email: 'another.user@example.com', password: '123456')
    Peep.create(message: 'This is a test peep from another user', user_id: user.id)
    visit '/'
    click_button 'Sign up'
    expect(current_path).to eq '/sign-up'
    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'password123'
    click_button 'Sign up'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'You are logged in as test@example.com'
    expect(page).to have_content 'This is a test peep from another user'
  end
end
