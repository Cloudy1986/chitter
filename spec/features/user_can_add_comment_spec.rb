require 'rails_helper'

RSpec.feature 'Add comments', type: :feature do
  scenario 'User can add a comment' do
    user = User.create(email: 'test@example.com', password: 'password123')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'View comments'
    expect(current_path).to eq "/peeps/#{peep.id}/comments"
    click_button 'Add a new comment'
    expect(current_path).to eq "/peeps/#{peep.id}/comments/new"
    fill_in 'comment_body', with: 'This is a comment'
    click_button 'Add comment'
    expect(current_path).to eq "/peeps/#{peep.id}/comments"
    expect(page).to have_content 'This is a comment'
  end

  scenario 'User cannot add a comment if not logged in' do
    user = User.create(email: 'test@example.com', password: 'password123')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    visit '/peeps'
    click_button 'View comments'
    expect(current_path).to eq "/peeps/#{peep.id}/comments"
    expect(page).to_not have_button 'Add a new comment'
    visit "/peeps/#{peep.id}/comments/new"
    expect(current_path).to eq '/log-in'
  end
end
