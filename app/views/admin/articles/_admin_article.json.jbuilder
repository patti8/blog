json.extract! admin_article, :id, :title, :lead, :content, :published_at, :slug, :created_at, :updated_at
json.url admin_article_url(admin_article, format: :json)
