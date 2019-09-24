require "./config/environment"
require "./app/models/user"
require "./app/models/movies"

class MovieController < ApplicationController
  
  get '/movies' do
    if logged_in?
     @user = User.find(session[:user_id])
    # do i need @user?
     @movies = Movies.all.select {|movie| movie.user_id == session[:user_id]}
     erb :'/movies/home' 
    else 
      redirect to "/login"
    end
  end
  
  get "/movies/new" do
    if !logged_in?
      redirect to "/login"
    else
      @movie= Movies.new 
      erb :"/movies/new"
    end
  end
  
  post "/movies/" do 
     @user = User.find(session[:user_id])
     @movie = Movies.create(:title => params[:title], :genre => params[:genre], :user_id => session[:user_id])
     @movie.save
    redirect to "/movies/#{@movie.id}"
  end
  
  get '/movies/:id' do 
    @movie = Movies.find_by_id(params[:id])
    erb :show
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
    redirect to "/movies/#{@movie.id}"
  end 
  
  delete '/movies/:id/delete' do 
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
