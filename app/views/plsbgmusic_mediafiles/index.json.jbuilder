json.array!(@plsbgmusic_mediafiles) do |plsbgmusic_mediafile|
  json.extract! plsbgmusic_mediafile, :id, :plsbgmusic_id, :mediafile_id
  json.url plsbgmusic_mediafile_url(plsbgmusic_mediafile, format: :json)
end
