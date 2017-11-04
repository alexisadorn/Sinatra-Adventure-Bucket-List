class ExperiencesController < ApplicationController
  #Users can only access this page if they are logged in. If not, redirect to '/login'
  get '/experiences' do
    @user = current_user
    erb :"experiences/experiences"
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

  get '/experiences/:id' do
    @user = current_user
    @experience = Experience.find(params["id"])
    erb :"experiences/show"
  end
end
