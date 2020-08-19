class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    pet = Pet.new(name: params[:pet][:name],
                  approx_age: params[:pet][:approx_age],
                  sex: params[:pet][:sex],
                  image: params[:pet][:image],
                  description: params[:pet][:description],
                  shelter_id: params[:pet][:shelter_id],
                  adopted: false)
    pet.save
    redirect_to "/shelters/#{params[:id]}/pets"
  end
end
