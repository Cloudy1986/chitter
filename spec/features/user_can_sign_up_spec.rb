require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'User can sign up' do
    Peep.create(message: 'This is a test peep')
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/sign-up'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    click_button 'Sign Up'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'This is a test peep'
  end
end
