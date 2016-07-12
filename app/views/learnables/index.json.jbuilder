json.array!(@learnables) do |learnable|
  json.extract! learnable, :id, :name, :title, :body
  json.url learnable_url(learnable, format: :json)
end
