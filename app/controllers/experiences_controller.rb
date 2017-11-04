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
    details = params["experience"]
    category_name = params["category"]["name"]
    category_ids = params["category"]["category_ids"]

    details.each do |att, val|
      if val.empty?
        flash[:empty] = "Please complete all fields!"
        redirect to '/experiences/new'
      end
    end

    exp = Experience.new(details)
    exp.user_id = session[:user_id]
    unless category_name.empty?
      if Category.find_by(:name => category_name) #check for duplicates
        category = Category.find_by(:name => category_name)
      else
        category = Category.create(:name => category_name)
      end
      exp.categories << category
    end
    if category_ids
      category_ids.each do |id|
        exp.categories << Category.find(id)
      end
    end

    exp.save

    flash[:success] = "Successfully created new experience!"
    redirect to "experiences/#{exp.id}"
  end

  get '/experiences/:id/edit' do
    # Only the user who the experience belongs to can see this route
    @experience = Experience.find(params["id"])
    erb :"experiences/edit"
  end

  patch '/experiences/:id' do
    @experience = Experience.find(params["id"])

    details = params["experience"]
    category_name = params["category"]["name"]
    category_ids = params["category"]["category_ids"]

    details.each do |att, val|
      if val.empty?
        flash[:empty] = "Please complete all fields!"
        redirect to '/experiences/new'
      end
    end

    @experience.update(details)
    @experience.categories.clear
    unless category_name.empty?
      if Category.find_by(:name => category_name) #check for duplicates
        category = Category.find_by(:name => category_name)
      else
        category = Category.create(:name => category_name)
      end
      @experience.categories << category
    end
    if category_ids
      category_ids.each do |id|
        @experience.categories << Category.find(id)
      end
    end

    @experience.save

    flash[:success] = "Successfully updated your experience!"
    redirect to "experiences/#{@experience.id}"
  end

  delete '/experiences/:id/delete' do
    #Only the user who owns it can delete it
    @experience = Experience.find(params[:id])
    @experience.destroy
    flash[:deleted] = "Your experience has been deleted"
    redirect to '/experiences'
  end

  get '/experiences/:id' do
    @user = current_user
    @experience = Experience.find(params["id"])
    erb :"experiences/show"
  end


end
