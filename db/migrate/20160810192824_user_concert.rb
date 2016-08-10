class UserConcert < ActiveRecord::Migration[5.0]
  
  def change
  	change_table :concerts do |t| 
  		t.belongs_to :user
  	end
  	change_table :paperclip_images do |t| 
  		t.belongs_to :concert
  	end
	end
end
