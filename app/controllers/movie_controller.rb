require "./config/environment"
require "./app/models/user"

class MovieController < ApplicationController
  
  get '/movies' do
    if !logged_in?
      redirect to "/login"
    else
      @user = User.find(session[:user_id])
      # erb :'/movies/home' make page to display user's movies 
    end
  end
  
end 
