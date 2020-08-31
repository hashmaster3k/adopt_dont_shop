# spec/features/shelters/new_spec.rb

require 'rails_helper'

RSpec.describe 'shelters new page' do

  it 'has form for creating new shelter' do
    visit '/shelters/new'

    fill_in :name, with: 'Test Shelter'
    fill_in :address, with: '123 1st St.'
    fill_in :city, with: 'Denver'
    select 'Colorado', from: :state
    fill_in :zip, with: '80102'

    click_button 'Create Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('Test Shelter')
  end

  it "displays message when field is empty" do
    visit '/shelters/new'

    fill_in :name, with: 'Test Shelter'
    fill_in :address, with: '123 1st St.'
    select 'Colorado', from: :state
    fill_in :zip, with: '80102'

    click_button 'Create Shelter'

    expect(page).to have_content('The following fields are missing: ["city"]')
  end
end
