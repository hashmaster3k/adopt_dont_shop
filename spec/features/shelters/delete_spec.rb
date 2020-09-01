# spec/features/shelters/delete_spec.rb

require 'rails_helper'

RSpec.describe 'delete a shelter tests' do
  before :each do
    @shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)


    @pet_1 = @shelter_1.pets.create(image: 'dog1.jpg',
                       name: 'Johnny',
                       approx_age: 3,
                       sex: 'male',
                       description: 'Cool pet!',
                       shelter_id: @shelter_1.id)

    @pet_2 = @shelter_1.pets.create(image: 'dog2.jpg',
                       name: 'Marg',
                       approx_age: 2,
                       sex: 'female',
                       description: 'Sweet pet!',
                       shelter_id: @shelter_1.id)

    @app_1 = Application.create!(name: "Billy Joel",
                               address: "1234 Song St.",
                               city: "Las Vegas",
                               state: "NV",
                               zip: "12345",
                               phone_num: "123-456-7890",
                               description: "I'm Bill Joel!",
                               pet_ids: ["#{@pet_1.id}"])
  end

  it 'cannot delete shelter if pet is pending adoption' do
    visit "/applications/#{@app_1.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
      click_button
    end

    visit "/shelters/#{@shelter_1.id}"

    click_button "Delete Shelter"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content("Unable to delete shelter due to pending pet approval")
  end
end
