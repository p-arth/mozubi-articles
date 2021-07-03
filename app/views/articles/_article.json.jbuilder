json.extract! article, :id, :title, :source, :body, :estimated_time, :created_at, :updated_at
json.url article_url(article, format: :json)
