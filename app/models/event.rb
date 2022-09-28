class Event < ApplicationRecord
  belongs_to :user, foreign_key:  "creator_id", class_name: "User"

  has_many :event_attendees, foreign_key: "event_id", class_name: "EventAttendee"
  has_many :attendees, through: :event_attendees, source: :user
end
