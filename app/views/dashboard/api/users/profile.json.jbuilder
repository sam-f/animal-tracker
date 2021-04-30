json.data do
  json.id @user.id
  json.type "users"
  json.attributes do
    json.push_notifications @user.push_notifications
  end
end
