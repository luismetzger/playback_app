require 'rails_helper'

RSpec.describe "PaperclipImages", type: :request do
  describe "GET /paperclip_images" do
    it "works! (now write some real specs)" do
      get paperclip_images_path
      expect(response).to have_http_status(200)
    end
  end
end
