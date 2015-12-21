json.array!(@worktime_broadcastings) do |worktime_broadcasting|
  json.extract! worktime_broadcasting, :id, :market_id, :wday, :start, :stop
  json.url worktime_broadcasting_url(worktime_broadcasting, format: :json)
end
