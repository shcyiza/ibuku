json.array!(@problematics) do |problematic|
  json.extract! problematic, :id
  json.url problematic_url(problematic, format: :json)
end
