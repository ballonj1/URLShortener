# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({email: "ballonj1@tcnj.edu"})
user2 = User.create({email: "julesleighcosta@gmail.com"})
user3 = User.create({email: "jlcosta1092@gmail.com"})
user4 = User.create({email: "adcordivari@gmail.com"})

url1 = ShortenedURL.generate_short_url(user2, 'http://vndosvnudisc.com/nvuaio')
url2 = ShortenedURL.generate_short_url(user3, 'http://vravfhbvusvnrefew.gov')

visit1 = Visit.record_visit!(user3, url2)
visit2 = Visit.record_visit!(user1, url2)
