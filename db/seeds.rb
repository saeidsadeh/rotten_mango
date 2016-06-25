# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "sa@yahoo.com", password: "1234567", firstname: "sam", lastname: "sami", is_admin: true)
User.create!(email: "ima@yahoo.com", password: "1234567", firstname: "ima", lastname: "ima")
User.create!(email: "bb@yahoo.com", password: "1234567", firstname: "bb", lastname: "bb")
User.create!(email: "dd@yahoo.com", password: "1234567", firstname: "dd", lastname: "ddd")
User.create!(email: "gg@yahoo.com", password: "1234567", firstname: "hh", lastname: "hhhh")
User.create!(email: "mm@yahoo.com", password: "1234567", firstname: "mm", lastname: "mmm")
User.create!(email: "ll@yahoo.com", password: "1234567", firstname: "ll", lastname: "lll")
User.create!(email: "oo@yahoo.com", password: "1234567", firstname: "oo", lastname: "ooo")
