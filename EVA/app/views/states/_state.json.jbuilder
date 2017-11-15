json.extract! state, :id,:name, :code, :grade, :protocol,:created_at, :updated_at
json.url state_url(state, format: :json)
