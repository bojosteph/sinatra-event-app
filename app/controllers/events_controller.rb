class EventsController < ApplicationController
  
  get '/events' do
    @events = Event.all
    @user = current_user
    erb :"/events/index.html"
  end

end