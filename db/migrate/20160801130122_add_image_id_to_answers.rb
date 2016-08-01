class AddImageIdToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :content_image, foreign_key: true
  end
end
