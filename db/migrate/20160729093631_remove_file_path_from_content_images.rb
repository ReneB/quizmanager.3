class RemoveFilePathFromContentImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :content_images, :file_path
  end
end
