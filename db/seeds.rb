# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"jorge@test.com", password:"test", role:"admin")
Project.create(name: "Name", password:"abcdefgh", field:1, kind:1, abstract: "asd", video_url: "asd.com", email:"test@test.com")