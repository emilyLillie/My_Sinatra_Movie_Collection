class CreateMovies < ActiveRecord::Migration
  
  def change
    create_table :movies do |t|
      t.text :title 
      t.text :genre 
      t.integer :user_id
    end 
  end

end
