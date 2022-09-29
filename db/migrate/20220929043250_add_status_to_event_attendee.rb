class AddStatusToEventAttendee < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendees, :status, :string
  end
end
