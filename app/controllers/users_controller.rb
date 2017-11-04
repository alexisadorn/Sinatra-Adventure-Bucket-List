class UsersController < ApplicationController
  # A user should not see the signup page if they are already logged in
  # A user should not see the login page if they are already logged in

  get '/signup' do
    redirect to '/experiences' if is_logged_in?

    erb :"users/signup"
  end

  post '/signup' do
    user_info = { :name => params["name"],
                  :email => params["email"],
                  :password => params["password"] }

    user_info.each do |attribute, value| #Can we consolidate this into a helper method at the bottom of this file?
      if value.empty?
        flash[:empty] = "Please complete all fields"
        redirect to '/signup'
      end
      #Also add a validation check in case an email is already in the system
    end

    new_user = User.create(user_info)
    session[:user_id] = new_user.id

    redirect to '/experiences'
  end

  get '/login' do
    redirect to '/experiences' if is_logged_in?

    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(:email => params["email"])

    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect to '/experiences'
    else
      redirect to '/login'
        #Flash message about incorrect password or no email address
        #Something like !user : flash-message for signup ? flash-message for wrong pw
    end
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  def is_logged_in?
    !!session[:user_id]
  end
end
