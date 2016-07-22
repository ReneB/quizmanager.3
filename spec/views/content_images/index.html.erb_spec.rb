require 'rails_helper'

RSpec.describe "content_images/index", type: :view do
  before(:each) do
    assign(:content_images, [
      FactoryGirl.create(:content_image, file_path: "File Path"),
      FactoryGirl.create(:content_image, file_path: "File Path")
    ])
  end

  it "renders a list of content_images" do
    render

    assert_select "tr>td", :text => "File Path".to_s, :count => 2
  end
end
