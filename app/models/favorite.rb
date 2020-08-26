class Favorite < ApplicationRecord

  def self.find_matching_pets
    Favorite.all.map do |fav|
      Pet.all.find(fav.pet_id)
    end
  end

end
