require "rails_helper"

RSpec.feature 'View peeps', type: :feature do
  scenario 'User can view a list of peeps' do
    Peep.new(message: 'This is peep 1').save
    Peep.new(message: 'This is peep 2').save
    Peep.new(message: 'This is peep 3').save
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content 'This is peep 2'
    expect(page).to have_content 'This is peep 3'
  end
end
