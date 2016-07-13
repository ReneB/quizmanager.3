class Question < ActiveRecord::Base
  belongs_to :user
  has_many :content_images
  has_one :content_image

  has_many :answers
  belongs_to :correct_answer, class_name: Answer

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :learnables

  accepts_nested_attributes_for :answers
end
