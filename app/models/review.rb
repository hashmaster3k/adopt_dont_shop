class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content

  def self.delete_associated_reviews
    Review.delete_all
  end
end
