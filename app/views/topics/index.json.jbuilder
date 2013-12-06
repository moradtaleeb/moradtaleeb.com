json.array!(@topics) do |topic|
  json.extract! topic, :title, :summary, :content, :category_id
  json.url topic_url(topic, format: :json)
end
