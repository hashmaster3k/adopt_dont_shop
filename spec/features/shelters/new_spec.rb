require 'rails_helper'

RSpec.describe 'shelters new page' do

  it 'has form for creating new shelter' do
    visit '/shelters/new'

    fill_in 'shelter[name]', with: 'Test Shelter'
    fill_in 'shelter[address]', with: '123 1st St.'
    fill_in 'shelter[city]', with: 'Denver'
    select 'Colorado', from: 'shelter[state]'
    fill_in 'shelter[zip]', with: '80102'

    click_button 'Create Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('Test Shelter')
  end
end
