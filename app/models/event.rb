class Event < ApplicationRecord
    validates :name, presence: true
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :enrollments
    has_many :attendees, :through => :enrollments, source: :user

    # def self.future_events
    #     where("date >= ?", Date.today)
    # end
    scope :future_events, -> { where("date >= ?", Date.today) }

    # def self.past_events
    #     where("date < ?", Date.today)
    # end
    scope :past_events, -> { where("date < ?", Date.today) }

end
