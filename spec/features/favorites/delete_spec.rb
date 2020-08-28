require 'rails_helper'

RSpec.describe 'delete favorite' do

  before :each do
    shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)


    @pet_1 = shelter_1.pets.create(image: 'dog1.jpg',
                       name: 'Johnny',
                       approx_age: 3,
                       sex: 'male',
                       shelter_id: shelter_1.id)

    @pet_2 = shelter_1.pets.create(image: 'dog2.jpg',
                       name: 'Marg',
                       approx_age: 2,
                       sex: 'female',
                       shelter_id: shelter_1.id)

    Favorite.create(pet_id: @pet_1.id)
    Favorite.create(pet_id: @pet_2.id)

    visit '/favorites'
  end

  it 'has a remove button' do

    expect(page).to have_button("REMOVE")
    expect(current_path).to eq("/favorites")
  end

  it "will remove a pet from favorites" do

    within ".pet-buttons-#{@pet_1.id}" do
      click_button ("REMOVE")
    end

    expect(current_path).to eq("/favorites")
    expect(page).to_not have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)
end

end
