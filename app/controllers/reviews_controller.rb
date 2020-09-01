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
      flash.now[:notice] = "One or more fields missing content."
      render :new
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    if review.update(review_params)
      redirect_to "/shelters/#{review.shelter_id}"
    else
      flash.discard[:notice] = "One or more fields missing content."
      redirect_to "/reviews/#{review.id}/edit"
    end
  end

  def destroy
    review = Review.find(params[:review_id])
    Review.delete(params[:review_id])
    redirect_to "/shelters/#{review.shelter_id}"
  end

  private
  def review_params
    params.permit(:title, :rating, :content, :shelter_id)
  end
end
