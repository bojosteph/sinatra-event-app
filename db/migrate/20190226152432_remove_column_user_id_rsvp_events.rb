class RemoveColumnUserIdRsvpEvents < ActiveRecord::Migration
  def change
    remove_column :rsvp_events, :user_id
  end
end
