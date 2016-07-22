require 'rails_helper'

RSpec.describe "learnables/new", type: :view do
  before(:each) do
    assign(:learnable, FactoryGirl.build(:learnable))
  end

  it "renders new learnable form" do
    render

    assert_select "form[action=?][method=?]", learnables_path, "post" do
      assert_select "input#learnable_title[name=?]", "learnable[title]"

      assert_select "textarea#learnable_body[name=?]", "learnable[body]"
    end
  end
end
