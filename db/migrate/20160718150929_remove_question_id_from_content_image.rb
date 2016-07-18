class RemoveQuestionIdFromContentImage < ActiveRecord::Migration[5.0]
  def change
    remove_column :content_images, :question_id
  end
end
