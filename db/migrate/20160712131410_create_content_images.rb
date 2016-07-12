class CreateContentImages < ActiveRecord::Migration
  def change
    create_table :content_images do |t|
      t.references :question, index: true
      t.references :answer, index: true
      t.string :file_path

      t.timestamps
    end
  end
end
