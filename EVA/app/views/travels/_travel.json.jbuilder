json.extract! travel, :id,:gpsReads, :gpsDate, :details, :cost, :kms, :hoursPlanned,:hoursTraveled, :idOrigen, :idDestine, :carrier_line_id, :company_id, :load_id, :driver_id, :state_id, :truck_id, :mt_id , :created_at, :updated_at
json.url travel_url(travel, format: :json)
