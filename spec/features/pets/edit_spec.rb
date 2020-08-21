#spec/features/pets/edit.html.erb

require 'rails_helper'

RSpec.describe 'edit individual pet info' do

   it 'fill form, submit and display modified pet' do
     shelter_1 = Shelter.create(name: 'Shelter 1',
                                address: '123 Bradford Rd',
                                city: 'Union City',
                                state: 'CA',
                                zip: 90210)

     pet_1 = Pet.create(image: 'dog1.jpg',
                        name: 'Johnny',
                        approx_age: 3,
                        sex: 'male',
                        description: 'Has a heart of gold!',
                        shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}/edit"

    fill_in :name, with: 'Patti'
    fill_in :approx_age, with: '2'
    fill_in :sex, with: 'female'
    fill_in :image, with: 'cat1.jpg'
    fill_in :description, with: 'Has a heart of gold!'

    click_button 'Update Info'

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content('Meet Patti!')
    expect(page).to have_content('Age: 2')
    expect(page).to have_content('Sex: female')
  end

end
