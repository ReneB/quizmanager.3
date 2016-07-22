class RemoveAnswerIdFromContentImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :content_images, :answer_id
  end
end
