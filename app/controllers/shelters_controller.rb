class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:shelter_id])
    @reviews = Review.find{|review| review.shelter_id == @shelter.id}
  end

  def show_pets
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets.where(adopted: false)
  end

  def new
  end

  def create
    Shelter.create(shelter_info)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:shelter_id])
  end

  def update
    shelter = Shelter.find(params[:shelter_id])
    shelter.update(shelter_info)
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:shelter_id])
    redirect_to '/shelters'
  end

  private
  def shelter_info
    params.permit(:name, :address, :city, :state, :zip)
  end
end
