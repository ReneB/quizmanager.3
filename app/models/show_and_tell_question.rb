class ShowAndTellQuestion < Question
  belongs_to :content_image, counter_cache: true

  def question_type
    "ShowAndTell"
  end

  def cache_key_components
    super + [ content_image ]
  end
end

