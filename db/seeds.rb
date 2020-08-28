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

shellys_shelter = Shelter.create(name: "Shelly's Shelter",
                                 address: "100 Bayside Ave.",
                                 city: "Fort Collins",
                                 state: "Colorado",
                                 zip: 80524,
                                 image: 'building_2.jpg')

sweet_petz = Shelter.create(name: "Sweet Petz",
                            address: "698 Freemont Rd.",
                            city: "Boulder",
                            state: "Colorado",
                            zip: 80301,
                            image: 'building_3.jpg')

adoptn_daves.pets.create(name: 'Lilly',
                         approx_age: 5,
                         sex: 'female',
                         image: 'dog1.jpg',
                         description:'Looking for a lady to bark at all those dang kids in your yard again? Lilly is your gal!')

adoptn_daves.pets.create(name: 'Alexa',
                         approx_age: 3,
                         sex: 'female',
                         image: 'cat2.jpg',
                         description:'Alexa is curious and playful! High energy.')

adoptn_daves.pets.create(name: 'Nala',
                        approx_age: 2,
                        sex: 'female',
                        image: 'dog4.jpg',
                        description: "The cutest little shihpoo you'll ever meet.")

shellys_shelter.pets.create(name: 'Murdoch',
                            approx_age: 5,
                            sex: 'male',
                            image: 'cat1.jpg',
                            description: "Murdoch is an easy going cat that loves to hang around and chill.")

shellys_shelter.pets.create(name: 'Fiona',
                            approx_age: 6,
                            sex: 'female',
                            image: 'dog3.jpg',
                            description: "Fiona is a sweet ol' lady that just loves to cuddle!")

shellys_shelter.pets.create(name: 'Charles',
                            approx_age: 3,
                            sex: 'male',
                            image: 'cat4.jpg',
                            description: "Charles is so elegant, everything disgusts him.")

sweet_petz.pets.create(name: 'Nikola',
                       approx_age: 4,
                       sex: 'male',
                       image: 'cat3.jpg',
                       description: "Named after Nikola Tesla, this cat is electrifying!")

sweet_petz.pets.create(name: 'Max',
                       approx_age: 6,
                       sex: 'male',
                       image: 'dog2.jpg',
                       description: "Max may look tough, but inside hes a softy!")

adoptn_daves.reviews.create(title: 'Wonderful place and people!',
                            rating: 5,
                            content: "The staff here are truely amazing people! They really seem to care about you and all of the pets they have. They want to find a home for each cutie!")

shellys_shelter.reviews.create(title: 'Did the job but could be better',
                               rating: 3,
                               content: "I found a real great pet that I wanted so I walked in but the staff wasn't much help. When I was able to finally get someones attention they were nice but the whole process took a long time and it smelled bad. The pet was awesome!")
