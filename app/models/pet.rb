class Pet < ApplicationRecord
  belongs_to :shelter

  def self.find_pets_by_ids(array_ids)
    Pet.where(id: array_ids)
  end
end
