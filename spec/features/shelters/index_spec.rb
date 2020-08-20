# spec/features/shelters/index_spec.rb

require 'rails_helper'

RSpec.describe 'shelters index page' do
  it 'should show all the shelter names'do
    shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)

    shelter_2 = Shelter.create(name:'Shelter 2',
                               address:'3221 Fordbrad Dr',
                               city:'Onion City',
                               state:'CA',
                               zip:90310)

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it 'has link to create new shelter' do
    visit '/shelters'
    expect(page).to have_link('CREATE NEW SHELTER')
    click_link "CREATE NEW SHELTER"
    expect(current_path).to eq('/shelters/new')
  end
end
