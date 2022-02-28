require 'rails_helper'

RSpec.describe Peep, type: :model do
  it 'is valid with valid attributes message and user_id' do
    user = User.create(email: 'test@example.com', password: '123456')
    expect(Peep.new(message: 'This is a peep', user_id: user.id)).to be_valid
  end

  it 'is not valid without valid attribute message' do
    user = User.create(email: 'test@example.com', password: '123456')
    expect(Peep.new(message: nil, user_id: user.id)).to_not be_valid
  end

  it 'is not valid without valid attribute user_id' do
    expect(Peep.new(message: 'This is a peep', user_id: nil)).to_not be_valid
  end

end
