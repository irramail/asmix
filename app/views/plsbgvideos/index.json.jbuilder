json.array!(@plsbgvideos) do |plsbgvideo|
  json.extract! plsbgvideo, :id, :name
  json.url plsbgvideo_url(plsbgvideo, format: :json)
end
