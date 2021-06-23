require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'An user can be created' do
    it 'User is valid when name, email, password, and password_confirmation present' do
      user = User.create(name: 'Maha Magdy', email: 'mahamagdy@gmail.com', password: '123456',
                         password_confirmation: '123456')
      expect(user).to be_valid
    end

    it 'User is not valid when name not present' do
      user = User.create(email: 'mahamagdy@gmail.com', password: '123456',
                         password_confirmation: '123456')
      expect(user).not_to be_valid
    end
  end
end
