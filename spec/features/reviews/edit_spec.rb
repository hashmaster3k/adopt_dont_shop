require 'rails_helper'

RSpec.describe 'edit review' do
  it 'has button to edit' do
    shelter_1 = Shelter.create!(name: 'Shelter 1',
                               address: '123 Bradford Rd',
                               city: 'Union City',
                               state: 'CA',
                               zip: 90210,
                               image: 'building_1.jpg')

    Review.create!(title: "Good Job",
                   rating: "5 stars",
                   content: "They did a good job",
                   shelter_id: shelter_1.id)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_button("Edit")
  end

 it "can edit a review" do

   shelter_1 = Shelter.create!(name: 'Shelter 1',
                              address: '123 Bradford Rd',
                              city: 'Union City',
                              state: 'CA',
                              zip: 90210,
                              image: 'building_1.jpg')

   review_1 = Review.create!(title: "Good Job",
                             rating: "5 stars",
                             content: "They did a good job",
                           shelter_id: shelter_1.id)

    visit "/reviews/#{review_1.id}/edit"

    fill_in :title, with: "Bad Job"
    fill_in :rating, with: "1 star"
    fill_in :content, with: "They lost my dog"

    click_button "Edit Review"

    expect(current_path).to eq "/shelters/#{shelter_1.id}"
    expect(page).to have_content "Bad Job"
    expect(page).to have_content "1 star"
    expect(page).to have_content "They lost my dog"
  end

  it "must have all form fields filled in" do
   shelter_1 = Shelter.create!(name: 'Shelter 1',
                              address: '123 Bradford Rd',
                              city: 'Union City',
                              state: 'CA',
                              zip: 90210,
                              image: 'building_1.jpg')
   review_1 = Review.create!(title: "Good Job",
                             rating: "5 stars",
                             content: "They did a good job",
                           shelter_id: shelter_1.id)
    visit "/reviews/#{review_1.id}/edit"

    fill_in :title, with: ""
    fill_in :rating, with: ""
    fill_in :content, with: ""

    click_button "Edit Review"

    expect(page).to have_content "One or more fields missing content."
    expect(current_path).to eq "/reviews/#{review_1.id}/edit"
 end

end
