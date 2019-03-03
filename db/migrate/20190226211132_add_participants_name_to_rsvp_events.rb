class AddParticipantsNameToRsvpEvents < ActiveRecord::Migration
  def change
    add_column :rsvp_events, :name, :string
  end
end
