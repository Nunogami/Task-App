# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)


99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(3)
50.times do |t|
  name = "タスク#{t+1}"
  description = "タスク詳細#{t+1}"
  users.each { |user| user.tasks.create!(task_name: name, task_description: description) }
end