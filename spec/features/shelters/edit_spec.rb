# spec/features/shelters/edit_spec.rb

require 'rails_helper'

RSpec.describe 'edit shelter page' do

  before :each do
    @shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)
  end

  it 'can edit a shelters info' do

    visit "/shelters/#{@shelter_1.id}/edit"

    fill_in :name, with: 'Test Shelter'
    fill_in :address, with: '1st St.'
    fill_in :city, with: 'Denver'
    select 'Colorado', from: :state
    fill_in :zip, with: '80102'

    click_button 'Update Shelter'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content('Test Shelter')
    expect(page).to have_content('1st St.')
    expect(page).to have_content('Denver')
    expect(page).to have_content('CO')
    expect(page).to have_content('80102')
  end

  it "will let you know what fields were blank" do

    visit "/shelters/#{@shelter_1.id}/edit"

    fill_in :name, with: 'Test Shelter'
    fill_in :address, with: '1st St.'
    fill_in :city, with: ''
    select 'Colorado', from: :state
    fill_in :zip, with: '80102'

    click_button 'Update Shelter'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    expect(page).to have_content('The following fields are missing: ["city"]')

  end
end
