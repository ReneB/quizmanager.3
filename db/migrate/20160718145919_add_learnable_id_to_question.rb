class AddLearnableIdToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :learnable_id, :integer
    add_foreign_key :questions, :learnables, column: 'learnable_id'
  end
end
