class Learnable < ActiveRecord::Base
  has_many :questions, inverse_of: :learnable

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false

  before_destroy do
    questions.find_each do |question|
      question.update(learnable: nil)
    end
  end

  before_update do
    questions.find_each(&:touch)
  end

  def description
    "#{title} - #{body}".truncate(100)
  end
end
