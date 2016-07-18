class DropLearnablesQuestions < ActiveRecord::Migration[5.0]
  def change
    drop_table :learnables_questions
  end
end
