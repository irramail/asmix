json.array!(@plsbgimages) do |plsbgimage|
  json.extract! plsbgimage, :id, :name
  json.url plsbgimage_url(plsbgimage, format: :json)
end
