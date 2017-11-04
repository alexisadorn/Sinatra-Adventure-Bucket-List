class ExperiencesController < ApplicationController
  #Users can only access this page if they are logged in. If not, redirect to '/login'
  get '/experiences' do
    @user = current_user
    erb :"experiences/experiences"
  end
end
