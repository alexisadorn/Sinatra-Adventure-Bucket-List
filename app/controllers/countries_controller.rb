class CountriesController < ApplicationController
  before '/countries/*' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
  end

  get '/countries' do
    if !is_logged_in?
      flash[:login] = "You need to be logged in to performance that action"
      redirect to '/login'
    end
    erb :"countries/countries"
  end

  get '/countries/:id' do
    @country = Country.find(params["id"])
    erb :"countries/show"
  end
end
