json.array!(@suborders) do |suborder|
  json.extract! suborder, :id, :order_id, :device_id, :period_id, :startdt, :stopdt, :startt, :stopt
  json.url suborder_url(suborder, format: :json)
end
