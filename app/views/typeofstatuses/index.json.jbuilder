json.array!(@typeofstatuses) do |typeofstatus|
  json.extract! typeofstatus, :id, :name, :priority
  json.url typeofstatus_url(typeofstatus, format: :json)
end
