require 'rails_helper'

RSpec.feature 'View peeps', type: :feature do
  scenario 'User can add a peep' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_link 'Add new peep'
    expect(current_path).to eq '/peeps/new'
    fill_in 'peep_message', with: 'This is a new peep'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a new peep'
  end
end
