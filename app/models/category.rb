class Category < ActiveRecord::Base
  has_and_belongs_to_many :questions, inverse_of: :categories

  before_destroy do
    if questions.any?
      errors[:base] << "Cannot delete a category that still has questions in it"

      throw :abort
    end
  end
end
