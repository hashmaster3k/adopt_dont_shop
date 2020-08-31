class ApplicationPetsController < ApplicationController

  def show
    @pet = Pet.find(params[:pet_id])
  end

end
