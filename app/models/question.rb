class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :learnable, inverse_of: :questions, touch: true, counter_cache: true

  has_many :answers, inverse_of: :question
  belongs_to :correct_answer, class_name: Answer

  has_and_belongs_to_many :categories, inverse_of: :questions, after_add: :break_cache, after_remove: :break_cache

  accepts_nested_attributes_for :answers

  after_create do
    if correct_answer.nil?
      self.correct_answer = answers.first
      save
    end
  end

  before_update do
    self.version_number += 1 if changed?
  end

  validate :has_categories?
  validates :answers, presence: true, length: { is: 4 }

  def cache_key
    ([super] + cache_key_components.compact.map(&:cache_key)).join('-')
  end

  def cache_key_components
    [learnable, categories]
  end

  def break_cache(_)
    touch if persisted?
  end

private
  def has_categories?
    categories.present? || errors.add(:categories, 'Must have at least one category')
  end
end
