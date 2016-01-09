json.array!(@plsbgmusic_devices) do |plsbgmusic_device|
  json.extract! plsbgmusic_device, :id, :plsbgmusic_id, :device_id
  json.url plsbgmusic_device_url(plsbgmusic_device, format: :json)
end
