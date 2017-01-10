require_relative '../rails_helper'

describe Bookmark do

  let(:user) {User.create(email: "test@test.com", password: "12345" )}
  let(:valid_bookmark) {Bookmark.new(url: "https://www.google.com/", user: user)}
  let(:invalid_bookmark) {Bookmark.new(url: "www.google.com", user: user)}
  let(:no_bookmark) {Bookmark.new(url: "", user: user)}

  it 'should be valid with an url' do
    valid_bookmark.valid?
    expect(valid_bookmark).to be_valid
  end

  it 'should be invalid with an invalid url' do
    invalid_bookmark.valid?
    expect(invalid_bookmark).to_not be_valid
  end

  it 'should be invalid with no url' do
    no_bookmark.valid?
    expect(no_bookmark.errors.full_messages).to include("Url is not a valid URL")
  end
end
