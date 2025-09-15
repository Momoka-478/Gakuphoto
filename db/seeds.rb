# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

maki = User.find_or_create_by!(email: "maki@example.com") do |user|
  user.name = "Maki"
  user.password = "password"
end

ichiro = User.find_or_create_by!(email: "ichiro@example.com") do |user|
  user.name = "Ichiro"
  user.password = "password"
end

momoka = Admin.find_or_create_by!(email: "momoka@example.com") do |admin|
  admin.name = "Momoka"
  admin.password = "pass1234"
end

Post.find_or_create_by!(title: "教室内") do |post_image|
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_image.body = "きれいに掃除をしました。"
  post_image.admin = momoka
end