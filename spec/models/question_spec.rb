require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "callbacks" do
    context "when a question is created" do
      context "even if no answers are set to be correct" do
        let(:answers)   { Array.new(4) do Answer.new end }
        let(:question)  { Question.new(answers: answers) }

        before :each do
          question.save
        end

        it "assumes the first answer is the correct one" do
          question.correct_answer == answers.first
        end
      end
    end
  end
end
