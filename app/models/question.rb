class Question < ActiveRecord::Base
  belongs_to :user
  has_many :content_images
  has_one :content_image

  has_many :answers
  belongs_to :correct_answer, class_name: Answer

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :learnables

  accepts_nested_attributes_for :answers

  after_create do
    if correct_answer.nil?
      self.correct_answer = answers.first
      save
    end
  end

  validate :has_categories?
  validates :answers, presence: true, length: { is: 4 }

private
  def has_categories?
    categories.present? || errors.add(:base, 'Must have at least one category')
  end
end
