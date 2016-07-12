class Question < ActiveRecord::Base
  belongs_to :user
  has_many :content_images
  has_one :content_image
end
