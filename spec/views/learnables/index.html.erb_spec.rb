require 'rails_helper'

RSpec.describe "learnables/index", type: :view do
  before(:each) do
    assign(:learnables, 2.times.map do
      FactoryGirl.create(:learnable,
        title: "Title",
        body: "MyText"
      )
    end)
  end

  it "renders a list of learnables" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
