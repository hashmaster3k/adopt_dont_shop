# spec/features/application_pets/show_spec.rb

require 'rails_helper'

RSpec.describe 'application_pets show page' do

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
  it "can view applications for pets" do
    visit "/pets/#{@pet_1.id}"

    expect(page).to have_button("VIEW APPLICATIONS FOR #{@pet_1.name.upcase}")

    click_button "VIEW APPLICATIONS FOR #{@pet_1.name.upcase}"

    expect(current_path).to eq("/application_pets/#{@pet_1.id}")
  end

  it "can list applicants and their links" do
    visit "/application_pets/#{@pet_1.id}"

    expect(page).to have_link(@app_1.name)
  end

  it "display a message if there are no applications" do
    visit "/pets/#{@pet_2.id}"

    click_button "VIEW APPLICATIONS FOR #{@pet_2.name.upcase}"

    expect(page).to have_content("This pet currently has no applications")
  end
end
