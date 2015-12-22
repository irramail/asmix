json.array!(@volumes) do |volume|
  json.extract! volume, :id, :device_id, :description, :name, :value
  json.url volume_url(volume, format: :json)
end
