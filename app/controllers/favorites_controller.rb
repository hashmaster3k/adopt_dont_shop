class FavoritesController < ApplicationController

  def index
    @pets = Favorite.find_by_id
  end

  def destroy
    binding.pry
    favorite = Favorite.where(pet_id: params[:pet_id]).first
    Favorite.destroy(favorite.id)
    redirect_to '/favorites'
  end

  def create
    Favorite.create(favorite_params)
    flash[:notice] = "This Pet has been Added to your Favorites"
    redirect_to "/pets/#{params[:pet_id]}"
  end

  private
  def favorite_params
    params.permit(:pet_id)
  end
end
