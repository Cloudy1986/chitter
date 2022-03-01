require 'rails_helper'

RSpec.feature 'Edit peeps', type: :feature do
  scenario 'User can edit a peep' do
    user = User.create(email: 'test@example.com', password: 'password123')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'Edit Peep'
    expect(current_path).to eq "/peeps/#{peep.id}/edit"
    fill_in 'peep_message', with: 'This is an edited peep'
    click_button 'Update Peep'
    expect(current_path).to eq '/peeps'
    expect(page).to_not have_content 'This is a peep'
    expect(page).to have_content 'This is an edited peep'
  end
end
