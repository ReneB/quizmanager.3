module AnswersHelper
  def label_text_for_answer(builder)
    if builder.object.new_record?
      if builder.index == 0
        "Correct Answer"
      else
        "Incorrect Answer"
      end
    else
      letter = 'ABCD'[builder.index]

      "Answer #{letter}"
    end
  end

  def radio_button_for_correctness_of_answer(builder)
    builder.radio_button :is_correct?, builder.object.id, name: "question[correct_answer_id]", checked: builder.object.is_correct?
  end
end
