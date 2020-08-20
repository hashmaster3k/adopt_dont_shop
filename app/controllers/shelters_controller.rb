class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def show_pets
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all.find_all {|pet| pet.shelter_id == params[:id].to_i && pet.adopted == false}
  end

  def new
  end

  def create
    shelter = Shelter.new(name: params[:shelter][:name],
                          address: params[:shelter][:address],
                          city: params[:shelter][:city],
                          state: params[:shelter][:state],
                          zip: params[:shelter][:zip])
    shelter.save
    redirect_to '/shelters'
  end

  def create_pet
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])

    shelter.update(name: params[:shelter][:name],
                   address: params[:shelter][:address],
                   city: params[:shelter][:city],
                   state: params[:shelter][:state],
                   zip: params[:shelter][:zip])

    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end
end
