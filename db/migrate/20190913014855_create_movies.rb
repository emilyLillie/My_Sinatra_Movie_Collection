class CreateMovies < ActiveRecord::Migration
  
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.integer :genre_id
      t.text :title 
    end 
  end

end
