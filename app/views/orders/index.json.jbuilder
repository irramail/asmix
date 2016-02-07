json.array!(@orders) do |order|
  json.extract! order, :id, :name, :status_id, :sun, :mon, :tue, :wed, :thu, :fri, :sat
  json.url order_url(order, format: :json)
end
