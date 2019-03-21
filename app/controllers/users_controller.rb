
class UsersController < ApplicationController
  
  get '/signup' do
    params.each do |label, input|
      if input.empty?
        flash[:user_error] = "Please enter a value for #{label}"
        redirect to '/signup'
      end
    end
    erb :"/users/signup.html"
  end

  post '/signup' do
    params.each do |label, input|
      if input.empty?
        flash[:user_error] = "Please enter a value for #{label}"
        redirect to '/signup'
      end
    end

    user = User.create(username: params['username'], email: params['email'], password: params['password'], full_name: params['full_name'])
    session[:user_id] = user.id

    redirect to '/events'
  end

  get '/login' do
    redirect to '/events' if logged_in?

    erb :"/users/login.html"
  end

  post '/login' do
    user = User.find_by(username: params['username'])
    session[:message] = " You Successfully Logged In #{user.full_name}"

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/events'
    else
      flash[:login_error] = 'Incorrect login. Please try again.'
      redirect to '/login'
    end
  end

  get '/users/:id' do
    redirect to '/login' unless logged_in?
    @user = current_user

    erb :"users/show.html"
  end

  get '/logout' do
    if logged_in?
      flash[:message] = 'You Have Successfully Logged Out'
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
