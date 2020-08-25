class ReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    # if params[:title] == "" || params[:rating] == "" || params[:content] == ""
    #   flash.now[:error] = "One or more fields are empty. Please fill in and resubmit."
    #   render action: "new"
    # else
    #   shelter = Shelter.find(params[:shelter_id])
    #   shelter.reviews.create(review_params)
    #   redirect_to "/shelters/#{shelter.id}"
    # end

    shelter = Shelter.find(params[:shelter_id])
    shelter.reviews.create(review_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :shelter_id)
  end
end
