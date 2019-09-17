class CreateMovies < ActiveRecord::Migration
  
  def change
    create_table :movies do |t|
      t.text :title 
      t.text :genre 
    end 
  end

end
