require 'rails_helper'

RSpec.feature 'Add comment', type: :feature do
  scenario 'User can add comments' do
    user = User.create(email: 'test@example.com', password: 'password123')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    visit '/'
    click_button 'Log in'
    fill_in 'session_email', with: 'test@example.com'
    fill_in 'session_password', with: 'password123'
    click_button 'Log in'
    click_button 'Comment'
    expect(current_path).to eq "/peeps/#{peep.id}/comment/new"
    fill_in 'comment_body', with: 'This is a comment'
    click_button 'Add Comment'
    expect(current_path).to eq "/peeps/#{peep.id}"
    expect(page).to have_content 'This is a comment'
  end
end
