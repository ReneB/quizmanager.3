class QuestionSerializer < SimpleDelegator
  def self.for(question)
    new(question)
  end

  def perform
    {
      ID: id,
      UnversionedID: unversioned_id,
      Version: version,
      Description: question_text,
      CampaignID: campaign_id,
      :'Question type' => question_type,
      Published: published?,
      Answers: answers.map.with_index do |answer, index|
        {
          ID: "#{id}_#{index+1}",
          Description: answer.content,
          Correct: answer.is_correct?
        }
      end,
      Categories: categories.map(&:title)
    }.tap do |serialized_question|
      serialized_question[:Learnable] = serialize_learnable if learnable.present?
    end
  end

  def question
    __getobj__
  end

  def id
    "#{unversioned_id}v#{version}"
  end

  def unversioned_id
    __getobj__.id.to_s
  end

  # TODO
  def version
    1.to_s
  end

  # TODO
  def published?
    true
  end

  # TODO
  def campaign_id
    1.to_s
  end

  # TODO
  def question_type
    "Textual"
  end

  def serialize_learnable
    if learnable.present?
      {
        Title: learnable.title,
        Description: learnable.body
      }
    end
  end

  # CampaignID
  # Question type
  # Published
  # Answers:
  #   ID
  #   Description
  #   Correct
  # Categories
  # Learnable
  #   ID
  #   Title
  #   Description
end
