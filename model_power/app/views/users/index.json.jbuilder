json.array!(@users) do |user|
  json.extract! user, :id, :uid, :sex, :age, :name, :password, :admin
  json.url user_url(user, format: :json)
end
