# spec/features/pets/delete_spec.rb

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

    @app_1 = Application.create!(name: "Billy Joel",
                              address: "1234 Song St.",
                              city: "Las Vegas",
                              state: "NV",
                              zip: "12345",
                              phone_num: "123-456-7890",
                              description: "I'm Bill Joel!",
                              pet_ids: ["#{@pet_1.id}"])
  end

  it "can not delete pet if applications is pending" do

    visit "/applications/#{@app_1.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
      click_button
    end

    visit "/pets"

    click_button "Remove Pet"

    expect(page).to have_content("Adoption status Pending. Can't Remove")
    expect(page).to have_content(@pet_1.name)
  end

  it "can delete a pet and remove from favorites" do

    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"

    visit "/pets"

    click_button "Remove Pet"

    visit '/favorites'
    expect(page).to_not have_content(@pet_1.name)
  end
end
