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

  def self.pets_pending?
    Pet.where(adopt_pending: true).count > 0
  end

  def self.remove_select_pets_from_db(pets)
    pets.each do |pet|
      pet.application_pets.delete_all_selected_app_pets
      Pet.destroy(pet.id)
    end
  end

  def self.num_of_total_applications
    binding.pry
    Pet.joins(:application_pets).where('application_pets.pet_id = pet.id').count
  end

end
