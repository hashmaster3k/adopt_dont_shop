class ShelterPetsController < ApplicationController
  def show
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets.unadopted_pets
  end
end
