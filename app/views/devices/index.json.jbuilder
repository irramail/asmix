json.array!(@devices) do |device|
  json.extract! device, :id, :market_id, :name, :ping, :tzdate, :sn, :comment, :active, :eq0, :eq1, :eq2, :eq3, :eq4, :eq5, :eq6, :eq7, :eq8, :eq9
  json.url device_url(device, format: :json)
end
