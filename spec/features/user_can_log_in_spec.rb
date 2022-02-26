require 'rails_helper'

RSpec.feature 'Log in', type: :feature do
  scenario 'User can log in with correct email and password' do
    Peep.create(message: 'This is a test peep')
    User.create(email: 'test@example.com', password: 'password123')
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/log-in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a test peep'
  end

  scenario 'User cannot log in with incorrect email' do
    Peep.create(message: 'This is a test peep')
    User.create(email: 'test@example.com', password: 'password123')
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/log-in'
    fill_in 'session_email', with: 'incorrect@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    expect(current_path).to eq '/log-in'
    expect(page).to have_content 'Log in to Chitter'
  end

  scenario 'User cannot log in with incorrect password' do
    Peep.create(message: 'This is a test peep')
    User.create(email: 'test@example.com', password: 'password123')
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/log-in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'incorrectpassword'
    click_button 'Log in'
    expect(current_path).to eq '/log-in'
    expect(page).to have_content 'Log in to Chitter'
  end
end
