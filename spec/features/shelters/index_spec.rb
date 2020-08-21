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

  it 'has buttons for creating, updating and deleting shelter' do
    Shelter.create(name:'Shelter 1',
                   address:'123 Bradford Rd',
                   city:'Union City',
                   state:'CA',
                   zip:90210)

    visit '/shelters'

    expect(page).to have_button('CREATE NEW SHELTER')
    expect(page).to have_button('Update Shelter')
    expect(page).to have_button('Delete Shelter')
  end
end
