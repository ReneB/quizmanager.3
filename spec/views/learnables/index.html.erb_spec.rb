require 'rails_helper'

RSpec.describe "learnables/index", type: :view do
  before(:each) do
    assign(:learnables, [
      Learnable.create!(
        :name => "Name",
        :title => "Title",
        :body => "MyText"
      ),
      Learnable.create!(
        :name => "Name",
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of learnables" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
