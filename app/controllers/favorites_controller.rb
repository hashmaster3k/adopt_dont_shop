class FavoritesController < ApplicationController

  def index
    @pets = Favorite.find_matching_pets
  end

  def create
    Favorite.create(favorite_params)
    flash[:notice] = "This Pet has been Added to your Favorites"
    #binding.pry
    redirect_to "/pets/#{params[:pet_id]}"
  end

  private
  def favorite_params
    params.permit(:pet_id)
  end
end
