class AddQuestionsCountToContentImages < ActiveRecord::Migration[5.0]
  def change
    add_column :content_images, :questions_count, :integer, default: 0
  end
end
