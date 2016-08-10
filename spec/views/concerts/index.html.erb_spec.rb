require 'rails_helper'

RSpec.describe "concerts/index", type: :view do
  before(:each) do
    assign(:concerts, [
      Concert.create!(),
      Concert.create!()
    ])
  end

  it "renders a list of concerts" do
    render
  end
end
