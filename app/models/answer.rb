class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  has_one :content_image
  has_one :learnable

  def is_correct?
    self == question.try(:correct_answer)
  end
end
