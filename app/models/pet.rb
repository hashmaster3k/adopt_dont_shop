class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  def self.find_pets_by_ids(array_ids)
    Pet.where(id: array_ids)
  end
end
