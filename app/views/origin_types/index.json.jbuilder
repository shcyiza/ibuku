json.array!(@origin_types) do |origin_type|
  json.extract! origin_type, :id, :name
  json.url origin_type_url(origin_type, format: :json)
end
