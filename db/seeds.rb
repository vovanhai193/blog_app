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