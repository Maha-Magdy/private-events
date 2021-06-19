require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        event = described_class.new
        expect(event).to_not be_valid
      end
    end

    describe 'date' do
      it 'must be present' do
        event = described_class.new(name: 'Maha')
        expect(event).to_not be_valid
      end
    end
  end

  describe 'User and Events' do
    it 'belongs to a user' do
      user = User.new(name: 'Maha Magdy', email: 'mahamagdy@gmail.com', password: '123456',
                      password_confirmation: '123456')
      user.save
      event = user.events.create(name: 'Birthday Party', date: Date.today)
      expect(event.user_id).to eq(user.id)
    end
  end
end
