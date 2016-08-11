require 'rails_helper'

RSpec.describe "concerts/new", type: :view do
  before(:each) do
    assign(:concert, Concert.new())
  end

  it "renders new concert form" do
    render

    assert_select "form[action=?][method=?]", concerts_path, "post" do
    end
  end
end
