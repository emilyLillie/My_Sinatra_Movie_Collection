class Movies < ActiveRecord::Base 
  # belongs_to :genre
  has_many :users_movies
  has_many :movies, through: :users_movies
  
end 