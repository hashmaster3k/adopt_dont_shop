class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content

  def self.delete_associated_reviews
    Review.delete_all
  end

  def self.average_rating
    if Review.count == 0
      0
    else
      Review.sum(:rating).to_f / Review.count.to_f
    end
  end
end
