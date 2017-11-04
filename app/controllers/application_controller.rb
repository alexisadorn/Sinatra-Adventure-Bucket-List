class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
