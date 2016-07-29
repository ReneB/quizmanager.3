require 'rails_helper'

RSpec.describe "content_images/index", type: :view do
  before(:each) do
    assign(:content_images, [
      FactoryGirl.create(:content_image),
      FactoryGirl.create(:content_image)
    ])
  end

  it "renders a list of content_images" do
    render

    assert_select "tbody>tr", count: 2
  end
end
