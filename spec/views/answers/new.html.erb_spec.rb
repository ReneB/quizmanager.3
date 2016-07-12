require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :type => "",
      :content => "MyString",
      :question => nil
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_type[name=?]", "answer[type]"

      assert_select "input#answer_content[name=?]", "answer[content]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"
    end
  end
end
