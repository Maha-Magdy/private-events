class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :events, inverse_of: 'creator', dependent: :destroy, foreign_key: :creator_id
  has_many :enrollments
  has_many :attended_events, through: :enrollments, source: :event
end
