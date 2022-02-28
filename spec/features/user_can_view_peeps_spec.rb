require 'rails_helper'

RSpec.feature 'View peeps', type: :feature do
  scenario 'User can view a list of peeps' do
    user = User.create(email: 'test@example.com', password: '123456')
    Peep.create(message: 'This is peep 1', user_id: user.id)
    Peep.create(message: 'This is peep 2', user_id: user.id)
    Peep.create(message: 'This is peep 3', user_id: user.id)
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content 'This is peep 2'
    expect(page).to have_content 'This is peep 3'
  end

  scenario 'User can view when a peep was created' do
    user = User.create(email: 'test@example.com', password: '123456')
    peep = Peep.create(message: 'This is peep 1', user_id: user.id)
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content(Time.parse("#{peep.created_at}").strftime("%H:%M %d/%m/%Y"))
  end

  scenario 'User can view who created a peep' do
    user = User.create(email: 'test@example.com', password: '123456')
    peep = Peep.create(message: 'This is peep 1', user_id: user.id)
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content user.email
  end
end
