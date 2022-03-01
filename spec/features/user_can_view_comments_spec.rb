require 'rails_helper'

RSpec.feature 'View comments', type: :feature do
  scenario 'User can view comments' do
    user = User.create(email: 'test@example.com', password: 'password123')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    Comment.create(body: 'This is a comment', peep_id: peep.id, user_id: user.id)
    Comment.create(body: 'This is a second comment', peep_id: peep.id, user_id: user.id)
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'View comments'
    expect(current_path).to eq "/peeps/#{peep.id}/comments"
    expect(page).to have_content 'This is a peep'
    expect(page).to have_content 'This is a comment'
    expect(page).to have_content 'This is a second comment'
  end

  scenario 'User can see when no comments have been added yet' do
    user = User.create(email: 'test@example.com', password: 'password123')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'View comments'
    expect(current_path).to eq "/peeps/#{peep.id}/comments"
    expect(page).to have_content 'This is a peep'
    expect(page).to have_content 'No comments yet'
  end
end
