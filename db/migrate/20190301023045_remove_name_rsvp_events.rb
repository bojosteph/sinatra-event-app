class RemoveNameRsvpEvents < ActiveRecord::Migration
  def change
    remove_column :rsvp_events, :name, :string
  end
end
