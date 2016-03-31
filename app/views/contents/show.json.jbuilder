json.array!(@mediafiles) do |mediafile|
  json.extract! mediafile, :id, :filename
end
