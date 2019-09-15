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
  
end 
