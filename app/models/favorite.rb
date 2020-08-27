class Favorite < ApplicationRecord

  def self.find_by_id
    Pet.where(id: Favorite.pluck(:pet_id))
  end

end
