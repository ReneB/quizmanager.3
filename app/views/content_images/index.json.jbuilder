json.array!(@content_images) do |content_image|
  json.extract! content_image, :id, :question_id, :answer_id, :file_path
  json.url content_image_url(content_image, format: :json)
end
