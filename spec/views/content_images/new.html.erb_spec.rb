require 'rails_helper'

RSpec.describe "content_images/new", type: :view do
  before(:each) do
    assign(:content_image, FactoryGirl.build(:content_image))
  end

  it "renders new content_image form" do
    render

    assert_select "form[action=?][method=?]", content_images_path, "post" do
      assert_select "input#content_image_file_path[name=?]", "content_image[file_path]"
    end
  end
end
