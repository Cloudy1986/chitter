require 'rails_helper'

RSpec.feature 'Delete peeps', type: :feature do
  scenario 'User can delete a peep' do
    user = User.create(email: 'test@example.com', password: 'password123')
    Peep.create(message: 'This is a peep', user_id: user.id)
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'Delete'
    expect(current_path).to eq '/peeps'
    expect(page).to_not have_content 'This is a peep'
  end
end
