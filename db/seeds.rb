# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Following relationships
#Relationship.create(follower_id: 1, followed_id: 6)
#Relationship.create(follower_id: 5, followed_id: 1)
#Relationship.create(follower_id: 6, followed_id: 5)
