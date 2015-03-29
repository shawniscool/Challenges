# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

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
old_params = 1
params = 0
50.times do |n|
  title = "a"
  task = Faker::Lorem.sentence(5)
  endDate = Time.now
  money =5
  params = {task: task, title: title, endDate:endDate , money:money, created_at:  Time.zone.now}
  name  = Faker::Name.name
  password = 'password'
  m = 5
  users.each do |user|
    m += 1
    email = "example-#{n+100*m}@railstutorial.org"
    user.challenges.create!(params)
    user.challenges.first.users.create!({name: name, email: email,password:password,
               password_confirmation: password})
  end
end