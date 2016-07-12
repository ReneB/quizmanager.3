class Question < ActiveRecord::Base
  belongs_to :user
  has_many :content_images
end
