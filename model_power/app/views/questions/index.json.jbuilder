json.array!(@questions) do |question|
  json.extract! question, :id, :qid, :1, :2, :3, :4, :a
  json.url question_url(question, format: :json)
end
