class Question < ActiveRecord::Base
  belongs_to :user
  has_many :content_images
  has_one :content_image
  has_many :answers
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :learnables
end
