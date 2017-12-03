json.extract! location, :id,:name,:RFID, :coordinates, :address, :street,:district, :extnum, :intnum, :zipCode, :region,:city,:state, :country, :description, :created_at, :updated_at
json.url location_url(location, format: :json)
