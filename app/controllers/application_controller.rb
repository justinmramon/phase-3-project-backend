require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    "<h1>Watch List</h1>"
  end

  get "/movies" do
    movies = Movie.all
    movies.to_json
  end

  get "/movies/:id" do
    movie = Movie.find(params[:id])
    movie.to_json
  end

  delete "/movies/:id" do
    movie = Movie.find(params[:id])
    movie.destroy
    movie.to_json
  end

  post "/movies" do
    movie = Movie.create(
    name: params[:name],
    description: params[:description],
    user_id: params[:user_id],
    poster_url: params[:poster_url]
  )
  movie.to_json
  end

  patch '/movies/:id' do
    movie = Movie.find(params[:id])
    movie.update(description: params[:description])
    movie.to_json
  end

  get "/users" do
    users = User.all
    users.to_json
  end

  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end

  post "/users" do
    user = User.create(
    name: params[:name]
  )
  user.to_json
  end


  def movie_params
    allowed_params = %w(description)
    params.select { |k,v| allowed_params.include?(k) }
    params.reject{|k, v| v.blank?}
  end


 

end
