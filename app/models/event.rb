class Event < ApplicationRecord
    validates :name, presence: true
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    # has_and_belongs_to_many :users
end
