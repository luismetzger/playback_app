json.extract! paperclip_image, :id, :created_at, :updated_at
json.url paperclip_image_url(paperclip_image, format: :json)