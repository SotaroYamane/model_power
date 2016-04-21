json.array!(@results) do |result|
  json.extract! result, :id, :rid, :qid, :uid, :ans
  json.url result_url(result, format: :json)
end
