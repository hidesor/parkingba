json.array!([:admin, @users]) do |user|
  json.extract! user, :id, :email, :account
  json.url user_url(user, format: :json)
end
