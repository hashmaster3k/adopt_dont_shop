# spec/features/shelters/show_spec.rb

require 'rails_helper'

RSpec.describe 'shelter show page' do

  it 'shows the shelters name, address, city, state and zip' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end

  it 'has a link to update shelter info' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_button('Update Shelter')
    click_button "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end

  it 'has a link to delete shelter' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_button('Delete Shelter')

    click_button "Delete Shelter"

    expect(current_path).to eq('/shelters')
  end

  it "shows its list of reviews" do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    review_1 = Review.create(shelter_id: shelter_1.id,
                              title: "The Best Shelter!",
                              rating: "5 Stars",
                              content: "The staff were super nice and the proccess was easy!")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)
  end

  it 'should have a link to create a review' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('CREATE NEW REVIEW')

    click_link 'CREATE NEW REVIEW'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/new")
  end

  it "has a link and can delete a review" do

    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    shelter_1.reviews.create!(title: 'Boooooooo',
                              rating: 1,
                              content: 'My pet got sick from this place')

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content('Boooooooo')
    expect(page).to have_content('Rating: 1 star')
    expect(page).to have_content('My pet got sick from this place')

    expect(page).to have_button('Delete Review')

    click_button 'Delete Review'

    expect(page).to_not have_content('Boooooooo')
    expect(page).to_not have_content('Rating: 1 star')
    expect(page).to_not have_content('My pet got sick from this place')


  end

  it "can show the number of pets in the shelter" do

    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    shelter_1.pets.create(image: 'dog1.jpg',
                                name: 'Johnny',
                                approx_age: 3,
                                sex: 'male')

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content("Number of pets: #{shelter_1.pets.count}")

  end

  it "can show average review" do

    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    shelter_1.pets.create(image: 'dog1.jpg',
                                name: 'Johnny',
                                approx_age: 3,
                                sex: 'male')

    shelter_1.reviews.create!(title: 'Boooooooo',
                              rating: 1,
                              content: 'My pet got place')

    shelter_1.reviews.create!(title: 'Weeeeeeeeee',
                              rating: 5,
                              content: 'My pet went down a slide')

    visit "/shelters/#{shelter_1.id}"


    expect(page).to have_content("Average Rating: 3.0")
  end

  it "shows how many applicants have applied" do

    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    pet_1 = shelter_1.pets.create(image: 'dog1.jpg',
                                name: 'Johnny',
                                approx_age: 3,
                                sex: 'male')

    app_1 = Application.create!(name: "Billy Joel",
                                address: "1234 Song St.",
                                city: "Las Vegas",
                                state: "NV",
                                zip: "12345",
                                phone_num: "123-456-7890",
                                description: "I'm Bill Joel!",
                                pet_ids: ["#{pet_1.id}"])


    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content("Current applications: 1")
  end

end
