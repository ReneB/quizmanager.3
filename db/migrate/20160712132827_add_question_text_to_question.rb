class AddQuestionTextToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_text, :text
  end
end
