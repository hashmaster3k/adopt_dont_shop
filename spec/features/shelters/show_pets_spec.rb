# spec/features/shelters/show_pets_spec.rb

require 'rails_helper'

RSpec.describe 'shelter show pets' do

  it 'shows only adoptable pets and attributes' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    pet_1 =  Pet.create(image: 'dog1.jpg',
                         name: 'Johnny',
                         approx_age: 3,
                         sex: 'male',
                         description: 'A very nice pet!',
                         adopted: false,
                         shelter_id: shelter_1.id)

    pet_2 =  Pet.create(image: 'dog2.jpg',
                         name: 'Maggie',
                         approx_age: 4,
                         sex: 'female',
                         description: 'A great pet!',
                         adopted: true,
                         shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_xpath("//img['#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content("Age: #{pet_1.approx_age}")
    expect(page).to have_content(pet_1.sex)

    expect(page).to_not have_content(pet_2.name)
    expect(page).to_not have_content("Age: #{pet_2.approx_age}")
    expect(page).to_not have_content(pet_2.sex)
  end

  it 'has link to create new pet' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_button('Create New Pet')
  end
end
