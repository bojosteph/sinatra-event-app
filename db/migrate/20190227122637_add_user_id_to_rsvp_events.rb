class AddUserIdToRsvpEvents < ActiveRecord::Migration
  def change
    add_column :rsvp_events, :user_id, :integer
  end
end
