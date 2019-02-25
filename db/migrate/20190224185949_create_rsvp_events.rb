class CreateRsvpEvents < ActiveRecord::Migration
  def change
    create_table :rsvp_events do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end
end
