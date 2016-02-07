json.array!(@plists) do |plist|
  json.extract! plist, :id, :suborder_id, :mediafile_id
  json.url plist_url(plist, format: :json)
end
