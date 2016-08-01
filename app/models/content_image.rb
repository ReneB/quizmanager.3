class ContentImage < ActiveRecord::Base
  has_attached_file :question_image, styles: { normal: "750x330", thumbnail: "250x110" }
  has_attached_file :answer_image,   styles: { normal: "270x186", thumbnail:   "90x62" }

  validates_attachment :question_image, content_type: { content_type: 'image/png' }
  validates_attachment :answer_image,   content_type: { content_type: 'image/png' }

  has_many :questions, class_name: 'ShowAndTellQuestion', inverse_of: :content_image
  has_many :answers, inverse_of: :content_image

  validates :filename, presence: true

  before_destroy do
    if in_use?
      errors[:base] << "Cannot delete images that are still being used in questions or answers"

      throw :abort
    end
  end

  before_update do
    [questions, answers].each do |relation|
      relation.update_all(updated_at: Time.now)
    end
  end

  def times_used
    @times_used ||= (questions_count + answers_count)
  end

  def in_use?
    times_used > 0
  end
end
