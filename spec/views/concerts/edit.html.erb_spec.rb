require 'rails_helper'

RSpec.describe "concerts/edit", type: :view do
  before(:each) do
    @concert = assign(:concert, Concert.create!())
  end

  it "renders the edit concert form" do
    render

    assert_select "form[action=?][method=?]", concert_path(@concert), "post" do
    end
  end
end
