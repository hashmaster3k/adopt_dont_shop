class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  validates_presence_of(:name)
  validates_presence_of(:approx_age)
  validates_presence_of(:sex)
  validates_presence_of(:image)
  validates_presence_of(:description)

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
    Pet.all.sum {|pet| pet.applications.count}
  end

  def approve_pet_adoption(adopter_id)
    update_attribute(:adopt_pending, true)
    update_attribute(:adopter_id, adopter_id)
  end

  def revoke_pet_adoption
    update_attribute(:adopt_pending, false)
    update_attribute(:adopter_id, nil)
  end

  def adopter_name
    applications.find(adopter_id).name
  end

end
