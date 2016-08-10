require 'rails_helper'

RSpec.describe "concerts/show", type: :view do
  before(:each) do
    @concert = assign(:concert, Concert.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
