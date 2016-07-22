require 'rails_helper'

RSpec.describe "learnables/show", type: :view do
  before(:each) do
    @learnable = assign(:learnable, FactoryGirl.create(:learnable))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
