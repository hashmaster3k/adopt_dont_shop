# spec/features/pets/show_spec.rb

RSpec.describe 'shows individual pet based on :id' do

  it 'shows individual pet information' do
    shelter_1 = Shelter.create(name:'Shelter 1',
                               address:'123 Bradford Rd',
                               city:'Union City',
                               state:'CA',
                               zip:90210)


    pet_1 = Pet.create(image: '1.jpg',
                       name: 'Johnny',
                       approx_age: 3,
                       sex: 'male',
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content("Age: #{pet_1.approx_age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Adoption Status: Ready for adoption!")
  end

end
