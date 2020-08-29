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

     @app_1 = Application.create!(name: "Billy Joel",
                                 address: "1234 Song St.",
                                 city: "Las Vegas",
                                 state: "NV",
                                 zip: "12345",
                                 phone_num: "123-456-7890",
                                 description: "I'm Bill Joel!",
                                 pet_ids: ["#{@pet_1.id}", "#{@pet_2.id}"])
  end

  it 'should show application details' do
    visit "/applications/#{@app_1.id}"

    expect(page).to have_content(@app_1.name)
    expect(page).to have_content(@app_1.address)
    expect(page).to have_content(@app_1.city)
    expect(page).to have_content(@app_1.state)
    expect(page).to have_content(@app_1.zip)
    expect(page).to have_content(@app_1.phone_num)
    expect(page).to have_content(@app_1.description)
    expect(page).to have_link(@pet_1.name)
    expect(page).to have_link(@pet_2.name)
  end
end
