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
end
