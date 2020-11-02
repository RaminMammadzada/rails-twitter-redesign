json.extract! user, :id, :username, :fullname, :photo, :coverImage, :created_at, :updated_at
json.url user_url(user, format: :json)
