class ShelterPetsController < ApplicationController
  def show
    @shelter = Shelter.find(params[:shelter_id])
  end
end
