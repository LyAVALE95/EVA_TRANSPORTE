json.extract! clientcontact, :id, :created_at, :names,:lastnames,:note,:hiredate,:movil, :tel, :mail, :active,:updated_at,:company_id,:customer_id,:warehouse_id
json.url clientcontact_url(clientcontact, format: :json)
