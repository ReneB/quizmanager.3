class AddFilenameToContentImages < ActiveRecord::Migration[5.0]
  def change
    add_column :content_images, :filename, :string
  end
end
