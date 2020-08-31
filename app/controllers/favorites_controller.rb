class FavoritesController < ApplicationController

  def index
    array_of_fav_ids = favorite.contents
    @pets = Pet.find_pets_by_ids(array_of_fav_ids)
    array_applied_ids = ApplicationPet.get_distinct_applied_pets
    @applied_pets = Pet.find_pets_by_ids(array_applied_ids)
  end

  def update
    pet_id = params[:pet_id]
    favorite = Favorite.new(session[:favorites])
    favorite.add_pet(pet_id)
    session[:favorites] = favorite.contents
    flash[:notice] = "This pet has been added to your favorites"
    redirect_to "/pets/#{pet_id}"
  end

  def destroy
    if params[:pet_id] == 'all'
      favorite.clear_contents
      flash[:notice] = "Removed all pets from favorites"
      redirect_to '/favorites'
    else
      favorite.remove_select_pet(params[:pet_id])
      flash[:notice] = "Removed pet from favorites"
      redirect_to '/favorites'
    end
  end
end
