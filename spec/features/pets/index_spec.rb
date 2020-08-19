require 'rails_helper'

RSpec.describe 'pets index page' do
  it 'shows all pets with image, name, age, sex, and shelter name' do
    shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)

    shelter_2 = Shelter.create(name:'Shelter 2',
                               address:'3221 Fordbrad Dr',
                               city:'Onion City',
                               state:'CA',
                               zip:90310)


    pet_1 = Pet.create(image: '1.jpg',
                       name: 'Johnny',
                       approx_age: 3,
                       sex: 'male',
                       shelter_id: shelter_1.id)

    pet_2 = Pet.create(image: '2.jpg',
                       name: 'Marg',
                       approx_age: 2,
                       sex: 'female',
                       shelter_id: shelter_2.id)

    visit '/pets'

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approx_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approx_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(shelter_2.name)

  end

end
