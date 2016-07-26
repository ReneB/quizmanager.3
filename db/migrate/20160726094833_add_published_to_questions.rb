class AddPublishedToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :published, :boolean, default: true
  end
end
