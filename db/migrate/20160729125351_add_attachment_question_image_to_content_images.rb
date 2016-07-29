class AddAttachmentQuestionImageToContentImages < ActiveRecord::Migration
  def self.up
    change_table :content_images do |t|
      t.attachment :question_image
    end
  end

  def self.down
    remove_attachment :content_images, :question_image
  end
end
