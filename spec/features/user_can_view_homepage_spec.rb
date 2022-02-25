require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario 'user can view homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
