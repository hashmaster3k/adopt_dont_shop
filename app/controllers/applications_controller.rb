class ApplicationsController < ApplicationController
  def new
    @favorites = Pet.find_pets_by_ids(favorite.contents)
  end

  def create
    app = Application.new(application_params)

    if app.save
      flash[:success] = "Your application has been submitted"
      favorite.remove_selected_pets(params[:pet_ids])
      redirect_to '/favorites'
    else
      flash[:notice] = "One or more fields was missing information"
      redirect_to '/application/new'
    end
  end

  private
  def application_params
    params.permit(:name,
                  :address,
                  :city,
                  :state,
                  :zip,
                  :phone_num,
                  :description,
                  :pet_ids => [])
  end
end
