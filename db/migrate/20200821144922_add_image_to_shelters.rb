class AddImageToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :image, :string
  end
end
