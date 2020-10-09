User.create!(name:  "gao",
email: "123@123.com",
password:              "123456",
password_confirmation: "123456",
admin: true)  

99.times do |n|
    name  = Faker::Name.name
    email = "sample-#{n+1}@example.com"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
