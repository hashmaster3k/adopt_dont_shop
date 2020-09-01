# spec/features/applications/new_spec.rb

require 'rails_helper'

RSpec.describe 'create new adoption application' do
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
                                    shelter_id: @shelter_1.id)

    @pet_2 = @shelter_1.pets.create(image: 'dog2.jpg',
                                    name: 'Marg',
                                    approx_age: 2,
                                    sex: 'female',
                                    shelter_id: @shelter_1.id)
  end

  it 'has link to start adoption process' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

    visit '/favorites'

    expect(page).to have_button('START ADOPTION PROCESS')
  end

  it 'it can select a few pets and submit' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

    visit '/favorites'

    click_button('START ADOPTION PROCESS')

    expect(current_path).to eq('/application/new')

    within "##{@pet_2.id}" do
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

    expect(current_path).to eq('/favorites')
    expect(page).to have_content("Your application has been submitted")
    expect(page).to have_content(@pet_1.name)
  end

  it 'it can select all pets and submit' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

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

    expect(current_path).to eq('/favorites')
    expect(page).to have_content("Your application has been submitted")
    expect(page).to have_content("No favorited pets :( Please add some!")
  end

  it "Flashes an notice if form isn't complete" do

    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

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
    #fill_in :city, with: 'Detroit'
    select 'Michigan', from: :state
    #fill_in :zip, with: 12345
    fill_in :phone_num, with: "555-555-5555"
    fill_in :description, with: "I'm a great person with a nice home"

    click_button 'Adopt!'

    expect(current_path).to eq('/application/new')
    expect(page).to have_content("One or more fields was missing information")
  end
end
