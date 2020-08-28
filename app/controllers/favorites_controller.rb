class FavoritesController < ApplicationController

  def index
    array_of_fav_ids = favorite.contents
    @pets = Pet.find_pets_by_ids(array_of_fav_ids)
  end

  def update
    pet_id = params[:pet_id]
    favorite = Favorite.new(session[:favorites])
    favorite.add_pet(pet_id)
    session[:favorites] = favorite.contents
    flash[:notice] = "This Pet has been Added to your Favorites"
    redirect_to "/pets/#{pet_id}"
  end

  def destroy

    if params[:pet_id] == 'all'
      favorite.contents.clear
      flash[:notice] = "Removed all pets from favorites"
      redirect_to '/favorites'
    else
      favorite.contents.delete(params[:pet_id].to_s)
      flash[:notice] = "Removed pet from favorites"
      redirect_to '/favorites'
    end
  end


end
