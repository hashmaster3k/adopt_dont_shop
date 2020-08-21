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
    Pet.create(pet_info.merge({:adopted=>false}))
    redirect_to "/shelters/#{params[:id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_info)
    redirect_to "/pets/#{pet.id}"
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
