s = QuestionSerializer.for(question)
json.ignore_nil!

json.ID                     s.id
json.UnversionedID          s.unversioned_id
json.Version                s.version
json.Description            s.question_text
json.CampaignID             s.campaign_id

json.set! 'Question type',  s.question_type

json.Published              s.published?

json.set!('Answers',        s.answers.each.with_index(1).to_a) do |answer_and_index|
  answer, index = answer_and_index

  json.set! :ID,            "#{s.id}_#{index}"
  json.set! :Description,   answer.content
  json.set! :Correct,       answer.is_correct?
end

json.Categories             s.categories.map(&:title)
json.Learnable do 
  json.set! :Title,         s.learnable.try(:title)
  json.set! :Description,   s.learnable.try(:body)
end
