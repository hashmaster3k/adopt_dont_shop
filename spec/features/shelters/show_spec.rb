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

    expect(page).to have_link('Update shelter')

    click_link "Update shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end

  it 'has a link to delete shelter' do
    shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_button('delete shelter')

    click_button "delete shelter"

    expect(Shelter.all.length).to eq(0)
    expect(current_path).to eq('/shelters')
  end
end
