# spec/features/applications/show_spec.rb

require 'rails_helper'

RSpec.describe 'applications show page' do
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
                                    description: 'Cool pet!',
                                    shelter_id: @shelter_1.id)

    @pet_2 = @shelter_1.pets.create!(image: 'dog2.jpg',
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

  it "can approve pet adoption" do
    visit "/applications/#{@app_1.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
      click_button
    end

    expect(current_path).to eq("/pets/#{@pet_1.id}")
    expect(page).to have_content("Pending")
    expect(page).to have_content("on hold for #{@app_1.name}")
  end

  it 'cannot approve pet for adoption more than once' do
    @app_2 = Application.create!(name: "Mark Morrison",
                                address: "1234 Song St.",
                                city: "Las Vegas",
                                state: "NV",
                                zip: "12345",
                                phone_num: "123-456-7890",
                                description: "Return of the Mack!",
                                pet_ids: ["#{@pet_1.id}", "#{@pet_2.id}"])

    visit "/applications/#{@app_1.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
      click_button
    end

    visit "/applications/#{@app_2.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
      click_button
    end

    expect(current_path).to eq("/applications/#{@app_2.id}")
    expect(page).to have_content("Adoption pending for this pet already.")
  end

  it 'can revoke pet adoption' do
    visit "/applications/#{@app_1.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
      click_button
    end

    visit "/applications/#{@app_1.id}"

    within "##{@pet_1.id}" do
      expect(page).to have_button('Revoke Application')
      click_button
    end

    expect(current_path).to eq("/applications/#{@app_1.id}")

    within "##{@pet_1.id}" do
      expect(page).to have_button('Approve Application')
    end

    visit "/pets/#{@pet_1.id}"

    expect(page).to have_content("Ready for adoption!")
  end
end
