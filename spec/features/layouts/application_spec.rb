# spec/features/layouts/application_spec.rb

 require 'rails_helper'

 RSpec.describe 'header and nav bar'  do

   it 'should always show links to home, shelter and pets' do
     visit '/'

     expect(page).to have_link('HOME', visible: false)
     expect(page).to have_link('SHELTERS', visible: false)
     expect(page).to have_link('PETS', visible: false)

     click_link 'HOME', visible: false

     expect(page).to have_link('HOME', visible: false)
     expect(page).to have_link('SHELTERS', visible: false)
     expect(page).to have_link('PETS', visible: false)

     click_link 'SHELTERS', visible: false

     expect(page).to have_link('HOME', visible: false)
     expect(page).to have_link('SHELTERS', visible: false)
     expect(page).to have_link('PETS', visible: false)

     click_link 'PETS', visible: false

     expect(page).to have_link('HOME', visible: false)
     expect(page).to have_link('SHELTERS', visible: false)
     expect(page).to have_link('PETS', visible: false)
   end

   it 'has a favorite pets counter visible from any page' do
     visit '/'
     expect(page).to have_link('FAVORITE PETS:', visible: false)
     click_link 'HOME', visible: false
     expect(page).to have_link('FAVORITE PETS:', visible: false)
     click_link 'SHELTERS', visible: false
     expect(page).to have_link('FAVORITE PETS:', visible: false)
     click_link 'PETS', visible: false
     expect(page).to have_link('FAVORITE PETS:', visible: false)
   end

 end
