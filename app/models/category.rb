class Category < ActiveRecord::Base
  has_and_belongs_to_many :questions, inverse_of: :categories
end
