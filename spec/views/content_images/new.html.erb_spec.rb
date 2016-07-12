require 'rails_helper'

RSpec.describe "content_images/new", type: :view do
  before(:each) do
    assign(:content_image, ContentImage.new(
      :question => nil,
      :answer => nil,
      :file_path => "MyString"
    ))
  end

  it "renders new content_image form" do
    render

    assert_select "form[action=?][method=?]", content_images_path, "post" do

      assert_select "input#content_image_question_id[name=?]", "content_image[question_id]"

      assert_select "input#content_image_answer_id[name=?]", "content_image[answer_id]"

      assert_select "input#content_image_file_path[name=?]", "content_image[file_path]"
    end
  end
end
