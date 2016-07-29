class AddAttachmentAnswerImageToContentImages < ActiveRecord::Migration
  def self.up
    change_table :content_images do |t|
      t.attachment :answer_image
    end
  end

  def self.down
    remove_attachment :content_images, :answer_image
  end
end
