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
    pet = Pet.new(pet_params)
    if pet.save
        redirect_to "/shelters/#{shelter.id}/pets"
    else
      flash.now[:notice] = "The following fields are missing: #{grab_empty_keys}"
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:pet_id])
  end

  def update
    pet = Pet.find(params[:pet_id])
    if params[:change] == "status-approve" && pet.adopt_pending == false
      pet.update_attribute(:adopt_pending, true)
      pet.update_attribute(:adopter_id, params[:adopter_id])
      redirect_to "/pets/#{pet.id}"
    elsif params[:change] == "status-revoke"
      pet.update_attribute(:adopt_pending, false)
      pet.update_attribute(:adopter_id, nil)
      redirect_to "/applications/#{params[:adopter_id]}"
    elsif pet.adopt_pending == true
      flash[:notice] = "Adoption pending for this pet already."
      redirect_to "/applications/#{params[:adopter_id]}"
    elsif pet.update(pet_params)
      redirect_to "/pets/#{pet.id}"
    else
      flash[:notice] = "The following fields are missing: #{grab_empty_keys}"
      redirect_to "/pets/#{pet.id}/edit"
    end
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    if pet.adopt_pending
      flash[:notice] = "Adoption status Pending. Can't Remove"
      redirect_to "/pets"
    else
      pet.application_pets.delete_all_selected_app_pets
      favorite.remove_select_pet(pet.id)
      Pet.destroy(params[:pet_id])
      flash[:notice] = "Succesfully Deleted Pet"
      redirect_to('/pets')
    end
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
  def grab_empty_keys
    keys = []
    params.each do |key, value|
      keys << key if value.empty?
    end
    keys
  end
end
