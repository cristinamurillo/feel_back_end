class CreateUserPaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_paintings do |t|
      t.references :user 
      t.references :painting 
      
      t.timestamps
    end
  end
end
