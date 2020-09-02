# spec/features/favorites/index_spec.rb

require 'rails_helper'

RSpec.describe 'favorites index page' do

  before :each do
    shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)


    @pet_1 = shelter_1.pets.create(image: 'dog1.jpg',
                                   name: 'Johnny',
                                   approx_age: 3,
                                   sex: 'male',
                                   description: 'Cool pet!',
                                   shelter_id: shelter_1.id)

    @pet_2 = shelter_1.pets.create(image: 'dog2.jpg',
                                   name: 'Marg',
                                   approx_age: 2,
                                   sex: 'female',
                                   description: 'Sweet pet!',
                                   shelter_id: shelter_1.id)
  end

  it 'has link to favorites page and can visit it' do
    visit '/'
    expect(page).to have_link('FAVORITE PETS: 0', visible: false)
    click_link 'FAVORITE PETS', visible: false
    expect(current_path).to eq("/favorites")
  end

  it 'can add pet to favorites' do
    visit "/pets/#{@pet_2.id}"

    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

    expect(current_path).to eq("/pets/#{@pet_2.id}")
    expect(page).to have_content('This pet has been added to your favorites')
    expect(page).to have_link('FAVORITE PETS: 1', visible: false)
  end

  it 'displays all favorite pets' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

    visit '/favorites'

    expect(page).to have_link('FAVORITE PETS: 2', visible: false)

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
  end

  it 'displays message when no favorites added' do
    visit '/favorites'

    expect(page).to have_content('No favorited pets :( Please add some!')
  end

  it 'can remove a single pet from favorites' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"

    visit '/favorites'

    click_button "REMOVE PET FROM FAVORITES"

    expect(current_path).to eq('/favorites')
    expect(page).to have_content('Removed pet from favorites')

    expect(page).to_not have_content(@pet_1.name)
  end

  it 'can remove all pets at once' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

    visit '/favorites'

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)

    within '.remove-all-favs' do
      click_button('REMOVE ALL PETS FROM FAVORITES')
    end

    expect(page).to have_content('No favorited pets :( Please add some!')
  end

  it 'can show a list of all pets with applications' do
    visit "/pets/#{@pet_1.id}"
    click_button "ADD #{@pet_1.name.upcase} TO FAVORITES"
    visit "/pets/#{@pet_2.id}"
    click_button "ADD #{@pet_2.name.upcase} TO FAVORITES"

    visit '/favorites'

    click_button('START ADOPTION PROCESS')

    expect(current_path).to eq('/application/new')

    within "#check-box-#{@pet_1.id}" do
      check
    end

    within "#check-box-#{@pet_2.id}" do
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

    within ".pet-app-box" do
      expect(page).to have_content("Pets with current Applications")
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_link(@pet_1.name)
      click_link(@pet_1.name)
      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end
  end

  it "can display text when no pets have been applied for" do
    visit "/favorites"

    expect(page).to have_content("No Pets Have Been Applied For")
  end

end
