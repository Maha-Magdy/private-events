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
      user = User.new(name: 'Maha Magdy', email: 'mahamagdyabdelaal@gmail.com',
                      password: '123456', password_confirmation: '123456')
      user.save
      event = user.events.create(name: 'Birthday Party', date: Date.today)
      expect(event.creator_id).to eq(user.id)
    end
  end

  describe 'Events and Attendees' do
    first_user = User.new(name: 'Maha Magdy', email: 'mahamagdyabdelaal@gmail.com',
                          password: '123456', password_confirmation: '123456')
    second_user = User.new(name: 'Maha', email: 'maha@gmail.com', password: '123456', password_confirmation: '123456')
    third_user = User.new(name: 'Magdy', email: 'magdy@gmail.com', password: '123456', password_confirmation: '123456')
    first_user.save
    second_user.save
    third_user.save
    event = first_user.events.create(name: 'Baby shower', date: Date.today)

    it 'Event can have may attendee' do
      event.attendees = [second_user, third_user]
      expect(event.attendees.size).to eq(2)
    end
  end
end
