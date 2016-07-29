require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  let(:question_text) { "This text is being matched in the spec" }

  before(:each) do
    assign(:questions, [
      FactoryGirl.create(:question, question_text: question_text),
      FactoryGirl.create(:question, question_text: question_text)
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: Regexp.new(question_text), count: 2
  end
end
