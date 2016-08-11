require 'rails_helper'

RSpec.describe "paperclip_images/edit", type: :view do
  before(:each) do
    @paperclip_image = assign(:paperclip_image, PaperclipImage.create!())
  end

  it "renders the edit paperclip_image form" do
    render

    assert_select "form[action=?][method=?]", paperclip_image_path(@paperclip_image), "post" do
    end
  end
end
