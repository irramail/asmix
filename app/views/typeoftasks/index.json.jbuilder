json.array!(@typeoftasks) do |typeoftask|
  json.extract! typeoftask, :id, :name, :priority
  json.url typeoftask_url(typeoftask, format: :json)
end
