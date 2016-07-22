require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      FactoryGirl.create(:question),
      FactoryGirl.create(:question)
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
