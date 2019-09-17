require "./config/environment"
require "./app/models/user"
# require "./app/models/movies"

class MovieController < ApplicationController
  
  get '/movies' do
    if logged_in?
     @user = User.find(session[:user_id])
     @movies = Movies.all.select {|movie| movie.user_id == session[:user_id]}
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
  
  post '/movies' do 
    @movie = Movies.create(:title => params[:title], :genre => params[:genre])
    @movie.save
    redirect to "/movies/#{Movies.last.id}"
  end
  
  get '/movies/:id' do 
    @movie = Movies.find_by_id(params[:id])
    erb :movie_info
  end 
  
  get '/movies/:id/edit' do 
    @movie = Movies.find_by_id(params[:id])
    erb :'/movies/edit'
  end 
  
  patch '/movies/:id' do 
    @movie = Movies.find_by_id(params[:id])
    @movie.title = params[:title]
    @movie.genre = params[:genre]
    @movie.save
  end 
  
  delete '/movies/:id' do 
    @movie = Movies.find_by_id(params[:id])
    @movie.delete 
    redirect '/movies'
  end 
  
  get '/movies/search/:title' do 
    @movie = Movies.find_by(params[:title])
    erb :'/movies/search'
  end 
  
  post '/movies/search/:title' do 
    @movie = Movies.find_by(params[:title])
    @movie.title 
    redirect '/movies/:id'
  end 
  
end 
