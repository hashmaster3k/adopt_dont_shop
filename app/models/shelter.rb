class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def remove_shelter_and_associations(pets)
    reviews.delete_associated_reviews
    pets.remove_select_pets_from_db(pets)
    destroy
  end

  def has_reviews?
    !reviews.empty?
  end
end
