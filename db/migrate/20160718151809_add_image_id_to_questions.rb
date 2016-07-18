class AddImageIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :content_image, foreign_key: true
  end
end
