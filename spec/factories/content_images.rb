FactoryGirl.define do
  factory :content_image do
    filename        { "image.png" }
    question_image  { File.new("#{Rails.root}/spec/support/fixtures/question_image.png") }
    answer_image    { File.new("#{Rails.root}/spec/support/fixtures/answer_image.png") }
  end
end
