class Learnable < ActiveRecord::Base
  has_many :questions, inverse_of: :learnable

  def description
    "#{title} - #{body}".truncate(100)
  end
end
