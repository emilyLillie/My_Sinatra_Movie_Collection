class UsersMovies < ActiveRecord::Base 
  belongs_to :user 
  belongs_to :movies
end 