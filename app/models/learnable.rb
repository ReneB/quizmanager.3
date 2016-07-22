class Learnable < ActiveRecord::Base
  has_many :questions, inverse_of: :learnable

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false

  def description
    "#{title} - #{body}".truncate(100)
  end
end
