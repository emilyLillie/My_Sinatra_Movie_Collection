require "./config/environment"
require "./app/models/user"
# require "./app/models/movies"

class MovieController < ApplicationController
  
  get '/movies' do
    if logged_in?
     @user = User.find(session[:user_id])
     erb :'/movies/home' 
    else 
      redirect to "/login"
    end
  end
  
  get '/movies/new' do
    if !logged_in?
      redirect to "/login"
    else
      erb :'/movies/new'
    end
  end
  
  post '/movies/new' do 
    @movie = Movie.create(:title => params[:title], :genre => params[:genre])
    redirect to "/movies/#{Movie.last.id}"
  end
  
  get '/movies/:id' do 
    @movie = Movie.find_by_id(params[:id])
    erb :movie_info
  end 
  
end 
