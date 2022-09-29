class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_attendees, foreign_key: :user_id, class_name: "EventAttendee"
  has_many :bookings, through: :event_attendees, source: :event
  has_many :events, foreign_key: :creator_id, class_name: "Event"
end
