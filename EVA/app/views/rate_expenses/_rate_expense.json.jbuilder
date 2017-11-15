json.extract! rate_expense, :id,:name, :description, :active, :cost, :created_at, :updated_at
json.url rate_expense_url(rate_expense, format: :json)
