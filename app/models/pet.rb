class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  #validates_presence_of(:name)
  #validates_presence_of(:approx_age)
  #validates_presence_of(:sex)
  #validates_presence_of(:image)
  #validates_presence_of(:shelter_id)
  #validates_presence_of(:description)

  def self.find_pets_by_ids(array_ids)
    Pet.where(id: array_ids)
  end
end
