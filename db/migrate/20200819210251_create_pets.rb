class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :approx_age
      t.string :sex
      t.string :image
    end
  end
end
