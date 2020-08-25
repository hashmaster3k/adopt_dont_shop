class ReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    review = Review.new(review_params)

    if review.save
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:notice] = "One or more fields missing content."
      render :new
    end

    # shelter = Shelter.find(params[:shelter_id])
    # shelter.reviews.create(review_params)
    # redirect_to "/shelters/#{shelter.id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :shelter_id)
  end
end
