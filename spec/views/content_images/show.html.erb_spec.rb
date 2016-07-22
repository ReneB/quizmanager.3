require 'rails_helper'

RSpec.describe "content_images/show", type: :view do
  before(:each) do
    @content_image = assign(:content_image, FactoryGirl.create(:content_image, file_path: "File Path"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File Path/)
  end
end
