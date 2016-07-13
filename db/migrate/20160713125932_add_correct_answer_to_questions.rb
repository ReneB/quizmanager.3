class AddCorrectAnswerToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :correct_answer_id, :integer
    add_foreign_key :questions, :answers, column: 'correct_answer_id'
  end
end
