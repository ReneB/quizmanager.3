class Answer < ActiveRecord::Base
  belongs_to :question
  has_one :content_image
  has_one :learnable
end
