class CreateLearnablesQuestions < ActiveRecord::Migration
  def change
    create_table :learnables_questions do |t|
      t.belongs_to :learnable, index: true
      t.belongs_to :question, index: true
    end
  end
end
