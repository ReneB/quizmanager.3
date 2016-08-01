class AddAnswersCountToContentImages < ActiveRecord::Migration[5.0]
  def change
    add_column :content_images, :answers_count, :integer, default: 0
  end
end
