json.array!(@tags) do |tag|
  json.extract! tag, :title, :category_id
  json.url tag_url(tag, format: :json)
end
