# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {
      name: 'Nicolas Ottonello',
      email: 'nicolas.ottonello@oktana.io',
      google_id: '117987300965788486082',
      picture: 'https://lh3.googleusercontent.com/-bS5GZrXyU4I/AAAAAAAAAAI/AAAAAAAAAAA/AGDgw-jpRC2yzB1hwhalqKSlQdeZqGcTJQ/s96-c/photo.jpg'
    },
    {
      name: 'nicolas ottonello',
      email: 'nicolas.ottonello96@gmail.com',
      google_id: '104473315722909414496',
      picture: 'https://lh6.googleusercontent.com/-oGTBrdHucBk/AAAAAAAAAAI/AAAAAAAAA2A/4cKYfSHHGXM/s96-c/photo.jpg'
    }
  ]
)

group = Group.create!(name: 'Los 3 Chiflados')

users[0].groups << group
users[1].groups << group

Friend.create!(
  [
    {
      user: users[0],
      group: group,
      friend: users[1]
    },
    {
      user: users[1],
      group: group,
      friend: users[0]
    }
  ]
)