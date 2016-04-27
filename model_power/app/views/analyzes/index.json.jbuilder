json.array!(@analyzes) do |analyze|
  json.extract! analyze, :id
  json.url analyze_url(analyze, format: :json)
end
