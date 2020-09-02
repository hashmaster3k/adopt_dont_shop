class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content

  def self.delete_associated_reviews
    Review.delete_all
  end

  def self.average_rating
    Review.average(:rating).to_f.round(1)
  end
end
