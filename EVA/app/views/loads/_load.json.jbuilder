json.extract! load, :id,:arrivalDate, :packageNumber, :details,:check, :cost,:customer_id, :warehouse_id,:carrier_line_id,:state_id,:state_id ,:type_scaffolds_id, :created_at, :updated_at,:active
json.url load_url(load, format: :json)
