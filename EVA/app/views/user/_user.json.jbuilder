json.extract! user, :id,:created_at,:active, :updated_at
json.url users_url(user, format: :json)
