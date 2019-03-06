class RsvpEventsController < ApplicationController

  get '/rsvp_events' do
    if logged_in?
      @user = current_user
      @rsvp_events = RsvpEvent.where(user_id: current_user.id)
      erb :"/rsvp_events/index.html"
    else
      flash[:error] = 'You are not currently logged in!'
      redirect to :"/login"
    end
  end

  post '/rsvp_events' do
    user = current_user
    rsvp_event = RsvpEvent.find_or_create_by(event_id: params[:event_id], user_id: user.id)
    event = Event.find(params[:event_id])
    event.id = rsvp_event.event_id
    event.save
    redirect to '/rsvp_events'
  end

  get '/rsvp_events/:id' do
    redirect to '/login' unless logged_in?
    @user = current_user
    @rsvp_event = RsvpEvent.find(params[:id])
    erb :"rsvp_events/show.html"
  end

  get '/user_rsvp_events/:id' do
    redirect to '/login' unless logged_in?
    @user = current_user
    @rsvp_events = RsvpEvent.where(event_id: params[:id])
    redirect to '/rsvp_events' if @rsvp_events.empty?

    erb :"rsvp_events/user_rsvp_events.html"
  end

  delete '/rsvp_events/:id/delete' do
    redirect to '/login' unless logged_in?
    @rsvp_event = RsvpEvent.find(params[:id])
    if current_user.id != @rsvp_event.user_id
      flash[:wrong_user] = 'You can only delete your events'
      redirect to '/rsvp_events'
    end
    @rsvp_event.delete
    flash[:message] = 'You Have Cancelled This Event'
    redirect to '/rsvp_events'
  end

  delete '/user_rsvp_events/:id/delete' do
    redirect to '/login' unless logged_in?
    @rsvp_event = RsvpEvent.where(event_id: params[:id])

    @rsvp_event.delete_all
    @rsvp_event
    flash[:message] = 'You Have Cancelled This Event Please Notify Participants of Cancellation'
    redirect to '/rsvp_events'
  end
end
