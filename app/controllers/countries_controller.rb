class ExperiencesController < ApplicationController
  get '/countries' do
    erb :"countries/countries"
  end

  get '/countries/:id' do
    @country = Country.find(params["id"])
    erb :"countries/show"
  end
end
