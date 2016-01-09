json.array!(@plsbgmusics) do |plsbgmusic|
  json.extract! plsbgmusic, :id, :name
  json.url plsbgmusic_url(plsbgmusic, format: :json)
end
