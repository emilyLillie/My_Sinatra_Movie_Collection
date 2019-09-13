
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "secrets"
  set :views, Proc.new { File.join(root, "../views/") }

#put helpers here so other controller classes would inherit them 

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

end

#made so other classes inherit the session and Sinatra::Base 