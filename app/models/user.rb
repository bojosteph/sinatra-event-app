class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password, :full_name
  has_many :events
  has_many :rsvp_events
end