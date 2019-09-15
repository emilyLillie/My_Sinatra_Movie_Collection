require "./config/environment"
require "./app/models/user"
# require "./app/models/movies"

class MovieController < ApplicationController
  
  get '/movies' do
    # if !logged_in?
    #   redirect to "/login"
    # else
    #   @user = User.find(session[:user_id])
    #   erb :'/movies/home' 
    # end
    "can u see me"
  end
  
end 
