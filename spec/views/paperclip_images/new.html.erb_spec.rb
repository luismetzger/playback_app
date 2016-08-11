require 'rails_helper'

RSpec.describe "paperclip_images/new", type: :view do
  before(:each) do
    assign(:paperclip_image, PaperclipImage.new())
  end

  it "renders new paperclip_image form" do
    render

    assert_select "form[action=?][method=?]", paperclip_images_path, "post" do
    end
  end
end
