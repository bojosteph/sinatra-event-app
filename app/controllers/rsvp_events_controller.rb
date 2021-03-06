class RsvpEventsController < ApplicationController

  get '/rsvp_events' do
    if logged_in?
      @user = current_user
      @rsvp_events = RsvpEvent.where(user: @user)
      erb :"/rsvp_events/index.html"
    else
      flash[:error] = 'You are not currently logged in!'
      redirect to :"/login"
    end
  end

  post '/rsvp_events' do
    user = current_user
    event = Event.find(params[:event_id])
    rsvp_event = user.rsvp_events.find_or_create_by(event: event)
    
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
    if @rsvp_events.empty?
      flash[:no_participant_error] = "You Have No Event Participants at This Time"
      redirect to "/events"
    end
    

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
    @event = Event.find(params[:id])

    @rsvp_event.delete_all && @event.delete
    @rsvp_event
    flash[:message] = 'You Have Cancelled This Event Please Notify Participants of Cancellation'
    redirect to '/events'
  end
end
