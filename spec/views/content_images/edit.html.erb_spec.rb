require 'rails_helper'

RSpec.describe "content_images/edit", type: :view do
  before(:each) do
    @content_image = assign(:content_image, FactoryGirl.create(:content_image))
  end

  it "renders the edit content_image form" do
    render

    assert_select "form[action=?][method=?]", content_image_path(@content_image), "post" do
    end
  end
end
