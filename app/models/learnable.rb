class Learnable < ActiveRecord::Base
  has_and_belongs_to_many :questions

  def description
    "#{name} - #{title} - #{body}".truncate(100)
  end
end
