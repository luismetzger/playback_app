class Concert < ApplicationRecord
	belongs_to :user
	has_many :paperclip_images
end
