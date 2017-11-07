class ExperiencesController < ApplicationController
  before '/experiences/*' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
  end

  get '/experiences' do
    if is_logged_in?
      @user = current_user
      erb :"experiences/experiences"
    else
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
  end

  get '/experiences/new' do
    @categories = Category.all
    erb :"experiences/create"
  end

  post '/experiences' do
    Experience.create_new_experience(params, 'new', session[:user_id])

    flash[:success] = "Successfully created new experience!"
    redirect to "experiences/#{@experience.id}"
  end

  get '/experiences/:id/new_from_user' do
    @experience = Experience.find(params["id"])
    erb :"experiences/create_from_user"
  end

  post '/experiences/new_from_user' do
    Experience.create_new_experience(params, 'user', session[:user_id])

    flash[:success] = "Successfully created new experience!"
    redirect to "experiences/#{@experience.id}"
  end

  get '/experiences/:id/edit' do
    @user = current_user
    @experience = Experience.find(params["id"])
    if @user.id != @experience.user_id
      flash[:edit_user] = "You can only edit your own experiences"
      redirect to "/experiences/#{@experience.id}"
    end
    erb :"experiences/edit"
  end

  patch '/experiences/:id' do
    exp = Experience.find(params["id"])

    Experience.update_experience(params, 'edit', exp)

    flash[:success] = "Successfully updated your experience!"
    redirect to "experiences/#{exp.id}"
  end

  delete '/experiences/:id/delete' do
    @user = current_user
    @experience = Experience.find(params[:id])
    if @user.id != @experience.user_id
      flash[:edit_user]
      redirect to '/experiences/#{@experience.id}'
    else
      @experience.destroy
      flash[:deleted] = "Your experience has been deleted"
      redirect to '/experiences'
    end
  end

  get '/experiences/:id' do
    @user = current_user
    @experience = Experience.find(params["id"])
    erb :"experiences/show"
  end

end
