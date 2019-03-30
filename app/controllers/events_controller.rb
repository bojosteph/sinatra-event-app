

class EventsController < ApplicationController
  
  get '/events' do
    if logged_in?
      @message = session.delete(:message)
      @events = Event.all
      erb :"/events/index.html"
    else
      redirect 'login'
    end
  end

  get '/events/new' do
    if logged_in?
      erb :'/events/new.html'
    else
      redirect to '/login'
    end
  end

  post '/events' do
    params.each do |label, input|
      if input.empty?
        flash[:user_error] = "Please enter a value for #{label}"
        redirect to '/events/new'
      end
    end
    user = current_user
    @event = user.events.build(name: params[:name], date: params[:date], location: params[:location], description: params[:description])
    @event.save

    flash[:message] = "You Have Succesfully Created #{@event.name} Event"
    redirect to "/users/#{user.id}"
  end

  get '/events/:id' do
    redirect to '/login' unless logged_in?
    @user = current_user
    @event = Event.find(params[:id])
    erb :"events/show_event.html"
  end

  get '/events/:id/edit' do
    redirect to '/login' unless logged_in?
    @event = Event.find(params[:id])
    if current_user.id != @event.user_id
      flash[:invalid_user] = 'You can only edit event that you created'
      redirect to '/events'
    end
    erb :"events/edit_event.html"
  end

  patch '/events/:id' do
    params.each do |label, input|
      if input.empty?
        flash[:user_error] = "Please enter a value for #{label}"
        redirect to "/events/#{params[:id]}/edit"
      end
    end
    event = Event.find(params[:id])
    event.update(name: params[:name], date: params[:date], location: params[:location], description: params[:description])
    event.save

    redirect to "/events/#{event.id}"
  end

  delete '/events/:id/delete' do
    redirect to '/login' unless logged_in?
    @user = current_user
    @event = Event.find(params[:id])
    @rsvp_event = RsvpEvent.where(event: @event)

    if current_user.id != @event.user_id
      flash[:wrong_user] = 'You can only delete your events'
      redirect to '/events'
    end
    flash[:message] = "You Have Succesfully Deleted #{@event.name} Event"
    @event.delete && @rsvp_event.delete_all
    redirect to "/users/#{@user.id}"
  end
end
