require 'rails_helper'

RSpec.describe "paperclip_images/index", type: :view do
  before(:each) do
    assign(:paperclip_images, [
      PaperclipImage.create!(),
      PaperclipImage.create!()
    ])
  end

  it "renders a list of paperclip_images" do
    render
  end
end
