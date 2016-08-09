require 'rails_helper'

RSpec.describe "paperclip_images/show", type: :view do
  before(:each) do
    @paperclip_image = assign(:paperclip_image, PaperclipImage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
