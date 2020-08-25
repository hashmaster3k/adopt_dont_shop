# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adoptn_daves = Shelter.create(name: "Adopt'n Dave's",
                              address: "1322 Marrow Dr.",
                              city: "Denver",
                              state: "Colorado",
                              zip: 80210,
                              image: 'building_1.jpg')
adoptn_daves.pets.create()
