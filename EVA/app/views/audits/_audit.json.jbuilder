json.extract! audit, :id, :results, :description,:created_at, :updated_at
json.url audit_url(audit, format: :json)
