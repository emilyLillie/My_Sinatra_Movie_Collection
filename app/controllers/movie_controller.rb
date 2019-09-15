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
    @movie.save
    redirect to "/movies/#{Movie.last.id}"
  end
  
  get '/movies/:id' do 
    @movie = Movie.find_by_id(params[:id])
    erb :movie_info
  end 
  
  get '/movies/:id/edit' do 
    @movie = Movie.find_by_id(params[:id])
    erb :'/movies/edit'
  end 
  
  patch '/movies/:id/edit' do 
    @movie = Movie.find_by_id(params[:id])
    @movie.title = params[:title]
    @movie.genre = params[:genre]
    @movie.save
  end 
  
  delete '/movies/:id' do 
    @movie = Movie.find_by_id(params[:id])
    @movie.delete 
    redirect to '/movies'
  end 
  
end 
