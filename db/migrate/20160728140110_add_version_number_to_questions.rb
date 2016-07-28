class AddVersionNumberToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :version_number, :integer, default: 1
  end
end
