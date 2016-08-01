class ContentImage < ActiveRecord::Base
  has_attached_file :question_image, styles: { normal: "750x330", thumbnail: "250x110" }
  has_attached_file :answer_image,   styles: { normal: "270x186", thumbnail:   "90x62" }

  validates_attachment :question_image, content_type: { content_type: 'image/png' }
  validates_attachment :answer_image,   content_type: { content_type: 'image/png' }

  has_many :questions, inverse_of: :content_image
  has_many :answers, inverse_of: :content_image

  validates :filename, presence: true

  def times_used
    @times_used ||= (questions.count + answers.count)
  end
end
