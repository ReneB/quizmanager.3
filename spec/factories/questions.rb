FactoryGirl.define do
  factory :question do
    user nil
    categories do
      (1..4).to_a.sample.times.map do
        build(:category)
      end
    end
    answers do
      4.times.map do
        build(:answer)
      end
    end
  end
end
