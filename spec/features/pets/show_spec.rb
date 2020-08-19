# spec/features/pets/show_spec.rb

require 'rails_helper'

RSpec.describe 'add new pet to shelter page' do

   it 'fill form, submit and display added pet' do
     shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}/pets/new"

    fill_in 'pet[name]', with: 'Patti'
    fill_in 'pet[approx_age]', with: '1'
    fill_in 'pet[sex]', with: 'female'
    fill_in 'pet[image]', with: '1.jpg'
    fill_in 'pet[description]', with: 'Has a heart of gold!'

    click_button 'Add pet'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content('Patti')
    expect(page).to have_content('Age: 1')
    expect(page).to have_content('Sex: female')
  end

end
