# spec/features/applications/show_spec.rb

require 'rails_helper'

RSpec.describe 'application show page' do
  before :each do
    @shelter_1 = Shelter.create!(name:'Shelter 1',
                                address:'123 Bradford Rd',
                                city:'Union City',
                                state:'CA',
                                zip:90210)


     @pet_1 = @shelter_1.pets.create!(image: 'dog1.jpg',
                        name: 'Johnny',
                        approx_age: 3,
                        sex: 'male',
                        shelter_id: @shelter_1.id)

     @pet_2 = @shelter_1.pets.create!(image: 'dog2.jpg',
                        name: 'Marg',
                        approx_age: 2,
                        sex: 'female',
                        shelter_id: @shelter_1.id)

     # app_1 = Application.create!(name: "Billy Joel",
     #                             address: "1234 Song St.",
     #                             city: "Las Vegas",
     #                             state: "NV",
     #                             zip: "12345",
     #                             phone_num: "123-456-7890",
     #                             description: "I'm Bill Joel!",
     #                             pet_ids: ["#{@pet_1.id}"])

    visit "/pets/#{@pet_1.id}"
    click_button 'ADD PET TO FAVORITES'
    visit "/pets/#{@pet_2.id}"
    click_button 'ADD PET TO FAVORITES'

    visit '/favorites'

    click_button('START ADOPTION PROCESS')

    expect(current_path).to eq('/application/new')

    within "##{@pet_2.id}" do
      check
    end
    within "##{@pet_1.id}" do
      check
    end

    fill_in :name, with: 'Jonny Walker'
    fill_in :address, with: '123 Sesame St.'
    fill_in :city, with: 'Detroit'
    select 'Michigan', from: :state
    fill_in :zip, with: 12345
    fill_in :phone_num, with: "555-555-5555"
    fill_in :description, with: "I'm a great person with a nice home"

    click_button 'Adopt!'

  end

  it 'should show application details' do
    visit

  end
end

# As a visitor
# When I visit an applications show page "/applications/:id"
# I can see the following:
# - name
# - address
# - city
# - state
# - zip
# - phone number
# - Description of why the applicant says they'd be a good home for this pet(s)
# - names of all pet's that this application is for (all names of pets should be links to their show page)
