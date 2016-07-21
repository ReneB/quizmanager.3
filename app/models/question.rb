class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :learnable, inverse_of: :questions
  belongs_to :content_image

  has_many :answers, inverse_of: :question
  belongs_to :correct_answer, class_name: Answer

  has_and_belongs_to_many :categories, inverse_of: :questions

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
    categories.present? || errors.add(:categories, 'Must have at least one category')
  end
end
