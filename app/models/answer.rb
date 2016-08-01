class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers, touch: true, dependent: :destroy
  belongs_to :content_image, counter_cache: true

  def is_correct?
    self == question.try(:correct_answer)
  end
end
