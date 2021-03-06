require "./config/environment"
require "./app/models/user"

class LoginController < ApplicationController
  # don't need to enable sessions here, since enabled in Application ApplicationController

  get '/' do 
    erb :homepage
  end 
  
  get '/login' do 
      erb :login 
  end 
  
  post '/login' do 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/movies'
    else 
      redirect '/login_failed'
    end 
  end 
  
  get '/login_failed' do 
    erb :login_failed
  end 
  
  get '/signup' do 
    if logged_in?
      redirect "/movies"
    else
      erb :signup
    end
   end
  
  post '/signup' do 
    if params[:username] != "" && params[:username] != "" && params[:password] != ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id

      redirect "/movies"
    else
      redirect "/signup"
    end
  end
  
  get '/logout' do
    session.clear 
    redirect '/' 
  end

end
 
  
  