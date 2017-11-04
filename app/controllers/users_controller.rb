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

    user_info.each do |attribute, value|
      if value.empty?
        flash[:empty] = "Please complete all fields!"
        redirect to '/signup'
      end
    end

    if User.find_by(:email => user_info[:email])
      flash[:account_taken] = "The email you provided is already in our system. Please log-in to continue."
      redirect to '/login'
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
      if user
        flash[:password] = "Your password is incorrect"
        redirect to '/login'
      else
        flash[:no_account] = "There is no account associated with that email address. Please sign up for one"
        redirect to '/signup'
      end
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
end
