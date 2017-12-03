json.extract! company, :id, :name, :legalName, :code, :tel, :active,:created_at, :updated_at
json.url company_url(company, format: :json)
