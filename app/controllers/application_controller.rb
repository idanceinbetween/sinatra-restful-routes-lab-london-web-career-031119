require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    erb :welcome
  end

  #INDEX
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #NEW
  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end

  #CREATE
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "recipes/#{@recipe.id}"
  end

  #SHOW
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #EDIT
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #UPDATE
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    redirect to "/recipes/#{recipe.id}"
  end

  #DESTROY
  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
    redirect to "/recipes"
  end

end
