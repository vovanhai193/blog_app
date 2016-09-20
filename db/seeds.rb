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
  body = Faker::Lorem.paragraph
  users.each { |user| user.entries.create!(title: title, body: body) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Add comment to entry
users.each do |user|
  my_entries = user.entries
    content = Faker::Lorem.sentence(5)
    user.followers.each do |f|
    my_entries.each do |entry|
      f.comments.create!(content: content, entry_id: entry.id)
    end
  end
end
