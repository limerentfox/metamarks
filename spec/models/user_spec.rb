require_relative '../rails_helper'

describe User do
  context 'validations' do

    let(:user) {User.new(email: 'christi@gmail.com', password: '1234')}
    let(:invalid_user_email) {User.new(password: '1234')}
    let(:invalid_user_password) {User.new(email: 'christi@gmail.com')}
    let(:invalid_user_bad_format) {User.new(email: 'christi@gmail')}
    let(:same_user) {User.new(email: 'christi@gmail.com', password: '12345')}

    it 'is valid with a email and a password' do
      expect(user).to be_valid
    end

    it 'is invalid without a email' do
      expect(invalid_user_email).to_not be_valid
    end

    it 'is invalid without a password' do
      expect(invalid_user_password).to_not be_valid
    end

    it 'is invalid without proper email format' do
      expect(invalid_user_bad_format).to_not be_valid
    end

    it 'is invalid without a unique email' do
      User.create(email: 'christi@gmail.com', password: '12345')
      expect(same_user).to_not be_valid
    end

  end
end
