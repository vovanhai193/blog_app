User.create!(name:  "Vo Van Hai",
             email: "example@railstutorial.org",
             password:              "vanhai",
             password_confirmation: "vanhai")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(5)
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title, body: body) }
end