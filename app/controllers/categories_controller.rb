class CategoriesController < ApplicationController
  get '/categories' do
    erb :"categories/categories"
  end

  get '/categories/:id' do
    @category = Category.find(params["id"])
    erb :"categories/show"
  end
end
