class RsvpEvent < ActiveRecord::Base
  belongs_to :event 
  belongs_to :user
end