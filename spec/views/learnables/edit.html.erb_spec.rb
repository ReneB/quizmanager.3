require 'rails_helper'

RSpec.describe "learnables/edit", type: :view do
  before(:each) do
    @learnable = assign(:learnable, FactoryGirl.create(:learnable))
  end

  it "renders the edit learnable form" do
    render

    assert_select "form[action=?][method=?]", learnable_path(@learnable), "post" do

      assert_select "input#learnable_title[name=?]", "learnable[title]"

      assert_select "textarea#learnable_body[name=?]", "learnable[body]"
    end
  end
end
