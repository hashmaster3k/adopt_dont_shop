# spec/features/favorites/index_spec.rb

require 'rails_helper'

RSpec.describe 'index favorites page' do

  it 'has link to favorites page and can visit it' do
    visit '/'
    expect(page).to have_link('FAVORITE PETS:', visible: false)
    click_link 'FAVORITE PETS', visible: false
    expect(current_path).to eq("/favorites")
  end

  it 'displays all favorite pets' do
    shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)


    pet_1 = shelter_1.pets.create(image: 'dog1.jpg',
                       name: 'Johnny',
                       approx_age: 3,
                       sex: 'male',
                       shelter_id: shelter_1.id)

    pet_2 = shelter_1.pets.create(image: 'dog2.jpg',
                       name: 'Marg',
                       approx_age: 2,
                       sex: 'female',
                       shelter_id: shelter_1.id)

    Favorite.create(pet_id: pet_1.id)
    Favorite.create(pet_id: pet_2.id)

    visit '/favorites'

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)

    visit "/pets/#{pet_1.id}"
  end

end
