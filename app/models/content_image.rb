class ContentImage < ActiveRecord::Base
  def self.question_image_size
    Size.new(750, 330)
  end

  def self.answer_image_size
    Size.new(270, 186)
  end

  has_attached_file :question_image, styles: { normal: question_image_size, thumbnail: question_image_size / 2 }
  has_attached_file :answer_image,   styles: { normal: answer_image_size, thumbnail:   answer_image_size / 2 }

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

  after_validation do
    while self.class.where(filename: filename).any?
      self.filename += "-1"
    end
  end

  def times_used
    @times_used ||= (questions_count + answers_count)
  end

  def in_use?
    times_used > 0
  end
end
