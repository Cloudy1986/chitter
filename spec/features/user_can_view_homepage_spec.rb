require "rails_helper"

RSpec.feature 'Homepage', type: :feature do
  scenario 'User creates a new widget' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
