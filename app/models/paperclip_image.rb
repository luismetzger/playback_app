class PaperclipImage < ApplicationRecord
	belongs_to :concert

	has_attached_file :asset, styles: { 
		medium: '300x300>', 
		small: '140X140>',
		thumb: '64x64!' 
	}
  	validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

end
