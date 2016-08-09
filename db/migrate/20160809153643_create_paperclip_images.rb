class CreatePaperclipImages < ActiveRecord::Migration[5.0]
  def change
    create_table :paperclip_images do |t|
      	t.timestamps
    end
    	add_attachment :paperclip_images, :asset
  end
end
