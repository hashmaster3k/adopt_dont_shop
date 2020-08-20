class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    pet = Pet.new(pet_info.merge({:adopted=>false}))
    pet.save
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to('/pets')
  end

  private
  def pet_info
    params[:shelter_id] = params[:id].to_i
    params.permit(:name,
                  :approx_age,
                  :sex,
                  :image,
                  :description,
                  :shelter_id)
  end
end
