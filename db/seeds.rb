# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create [
  { email: "sam@appacademy.io", password: "123456" },
  { email: "daffyduck@wb.com", password: "123456" },
  { email: "mario@kart.com", password: "123456" },
  { email: "pikachu@pokemon.com", password: "123456" },
  { email: "link@hyrulecastle.com", password: "123456" }
]
