require 'rails_helper'

RSpec.feature 'View peeps', type: :feature do
  scenario 'User can view a list of peeps' do
    Peep.create(message: 'This is peep 1')
    Peep.create(message: 'This is peep 2')
    Peep.create(message: 'This is peep 3')
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content 'This is peep 2'
    expect(page).to have_content 'This is peep 3'
  end

  scenario 'User can view when a peep was created' do
    peep = Peep.create(message: 'This is peep 1')
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content(Time.parse("#{peep.created_at}").strftime("%H:%M %d/%m/%Y"))
  end
end
