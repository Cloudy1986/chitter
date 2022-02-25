require 'rails_helper'

RSpec.describe Peep, type: :model do

  it 'is valid with valid attribute message' do
    expect(Peep.new(message: "This is a peep")).to be_valid
  end

  it "is not valid without valid attribute message" do
    expect(Peep.new(message: nil)).to_not be_valid
  end
  
end
