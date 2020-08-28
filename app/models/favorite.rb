class Favorite < ApplicationRecord

  def self.find_by_id
    Pet.where(id: Favorite.pluck(:pet_id))
  end

  def self.remove_selected_pets(pets)
    pets.each_with_index do |pet, i|
      fav_id = Favorite.where(pet_id: pet).first.id
      Favorite.destroy(fav_id)
    end
  end

end
