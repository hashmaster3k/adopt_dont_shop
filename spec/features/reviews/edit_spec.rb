require 'rails_helper'

RSpec.describe 'edit review' do
  it 'has button to edit' do
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
    fill_in :title, with: "1 star"
    fill_in :title, with: "They lost my dog"

    click_button "Edit Review"

    expect(current_path).to eq "/shelters/#{shelter_1.id}"
    expect(page).to have_content "Bad Job"
    expect(page).to have_content "1 star"
    expect(page).to have_content "They lost my dog"

 end

end
