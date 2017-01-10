require_relative '../rails_helper'

describe Tag do

  let(:tag) {Tag.new(name: "apple")}


  it 'should be invalid with same name' do
    Tag.create(name: "apple")
    expect(tag).to_not be_valid
  end

end
