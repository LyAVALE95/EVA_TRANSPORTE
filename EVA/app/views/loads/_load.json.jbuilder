json.extract! load, :id,:arrivalDate, :packageNumber, :details,:check, :cost,:customer_id, :warehouse_id,:carrier_line_id,:state_id,:state_id , :created_at, :updated_at
json.url load_url(load, format: :json)
