class CreatePet < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.integer :approx_age
      t.string :sex
      t.integer :shelter_id
    end
  end
end
