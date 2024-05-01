user_data = JSON.parse(File.read('./data/users.json'))

user_data.each do |user|
  User.create!(user)
end