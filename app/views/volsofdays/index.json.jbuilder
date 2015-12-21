json.array!(@volsofdays) do |volsofday|
  json.extract! volsofday, :id, :name, :time, :value, :market_id
  json.url volsofday_url(volsofday, format: :json)
end
