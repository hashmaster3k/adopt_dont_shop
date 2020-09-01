# spec/features/reviews/new_spec.rb

require 'rails_helper'

RSpec.describe 'create new review' do
  it 'can fill form and create a new review' do
    shelter_1 = Shelter.create!(name: 'Shelter 1',
                               address: '123 Bradford Rd',
                               city: 'Union City',
                               state: 'CA',
                               zip: 90210,
                               image: 'building_1.jpg')

    visit "/shelters/#{shelter_1.id}/reviews/new"

    fill_in :title, with: 'Best Service Ever'
    fill_in :rating, with: 5
    fill_in :content, with: 'They really care!'

    click_button 'Create Review'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content('Best Service Ever')
    expect(page).to have_content('Rating: 5')
    expect(page).to have_content('They really care!')
  end

  it 'must have all form fields filled in' do
    shelter_1 = Shelter.create!(name: 'Shelter 1',
                               address: '123 Bradford Rd',
                               city: 'Union City',
                               state: 'CA',
                               zip: 90210,
                               image: 'building_1.jpg')

    visit "/shelters/#{shelter_1.id}/reviews/new"

    click_on 'Create Review'

    expect(page).to have_content('One or more fields missing content.')
    expect(page).to have_button('Create Review')
  end
end
