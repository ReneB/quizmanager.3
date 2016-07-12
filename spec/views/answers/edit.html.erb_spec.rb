require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :type => "",
      :content => "MyString",
      :question => nil
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input#answer_type[name=?]", "answer[type]"

      assert_select "input#answer_content[name=?]", "answer[content]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"
    end
  end
end
