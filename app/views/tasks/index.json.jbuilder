json.array!(@tasks) do |task|
  json.extract! task, :id, :device_id, :typeoftask_id, :typeofstatus_id, :options
  json.url task_url(task, format: :json)
end
