json.extract! warehouse, :id, :name, :scheduleStart, :scheduleEnd, :scheduleDays, :tel,:location_id, :company_id, :clientcontact_id,:created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)
