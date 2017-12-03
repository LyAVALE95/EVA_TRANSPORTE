json.extract! customer, :id,:names, :lastnames,:address,:city, :state,:country, :region, :cp, :notes, :tel, :movil, :schedule, :active, :company_id, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
