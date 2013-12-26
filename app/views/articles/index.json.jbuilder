json.array!(@articles) do |article|
  json.extract! article, :id, :title, :summary, :url
  json.url article_url(article, format: :json)
end
