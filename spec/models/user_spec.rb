require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(email: 'test@example.com', password: '123456')).to be_valid
  end

  it 'is not valid without valid attribute email' do
    expect(User.new(email: nil, password: '123456')).to_not be_valid
  end

  it 'is not valid without valid attribute password' do
    expect(User.new(email: 'test@example.com', password: nil)).to_not be_valid
  end
end
