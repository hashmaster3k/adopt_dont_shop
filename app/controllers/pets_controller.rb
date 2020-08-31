class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @shelters = Shelter.all
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    shelter.pets.create(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:pet_id])
  end

  def update
    pet = Pet.find(params[:pet_id])
    if pet.adopt_pending == true
      flash[:notice] = "Adoption pending for this pet already."
      redirect_to "/applications/#{params[:adopter_id]}"
    elsif params[:change] == "status"
      pet.update_attribute(:adopt_pending, true)
      pet.update_attribute(:adopter_id, params[:adopter_id])
      redirect_to "/pets/#{pet.id}"
    else
      pet.update(pet_params)
      redirect_to "/pets/#{pet.id}"
    end
  end

  def destroy
    Pet.destroy(params[:pet_id])
    redirect_to('/pets')
  end

  private
  def pet_params
    params.permit(:name,
                  :approx_age,
                  :sex,
                  :image,
                  :description,
                  :shelter_id)
  end
end
