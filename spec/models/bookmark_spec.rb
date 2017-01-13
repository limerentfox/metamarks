require_relative '../rails_helper'

describe Bookmark do

  let(:user) {User.create(name: 'Test', email: "test@test.com", password: "12345" )}
  let(:valid_bookmark) {Bookmark.new(url: "https://www.google.com/", user: user)}
  let(:invalid_bookmark) {Bookmark.new(url: "www.google.com", user: user)}
  let(:no_bookmark) {Bookmark.new(url: "", user: user)}

  context 'validations' do

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

  context 'tag creations' do
    
    it 'should create 4 tags in the table' do
      valid_bookmark.all_tags = "Google, browser, SEARCH, TesTing"
      expect(Tag.count).to eq(4)
    end

    it 'should create 1 tag in the table' do
      valid_bookmark.all_tags = "Google, GOOGLE, GoOgLe,     google     "
      expect(Tag.count).to eq(1)
    end

    it 'should contain tag: search' do
      valid_bookmark.all_tags = "Google, browser, SEARCH, TesTing"
      expect(valid_bookmark.all_tags).to include("search")
    end

    it 'should not contain tag: SEARCH' do
      valid_bookmark.all_tags = "Google, browser, SEARCH, TesTing"
      expect(valid_bookmark.all_tags).to_not include("SEARCH")
    end

  end

end
