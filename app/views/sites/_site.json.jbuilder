json.extract! site, :id, :url, :analytics, :created_at, :updated_at
json.url site_url(site, format: :json)