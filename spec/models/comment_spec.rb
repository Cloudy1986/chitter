require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes body, peep_id and user_id' do
    user = User.create(email: 'test@example.com', password: '123456')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    expect(Comment.new(body: 'This is a comment', peep_id: peep.id, user_id: user.id)).to be_valid
  end

  it 'is not valid without valid attribute body' do
    user = User.create(email: 'test@example.com', password: '123456')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    expect(Comment.new(body: nil, peep_id: peep.id, user_id: user.id)).to_not be_valid
  end

  it 'is not valid without valid attribute peep_id' do
    user = User.create(email: 'test@example.com', password: '123456')
    expect(Comment.new(body: 'This is a comment', peep_id: nil, user_id: user.id)).to_not be_valid
  end

  it 'is not valid without valid attribute user_id' do
    user = User.create(email: 'test@example.com', password: '123456')
    peep = Peep.create(message: 'This is a peep', user_id: user.id)
    expect(Comment.new(body: 'This is a comment', peep_id: peep.id, user_id: nil)).to_not be_valid
  end
end
