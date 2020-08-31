class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  def self.find_pets_by_ids(array_ids)
    Pet.where(id: array_ids)
  end

  def self.total_pets
    Pet.count
  end

  def self.unadopted_pets
    Pet.where(adopted: false)
  end
end
