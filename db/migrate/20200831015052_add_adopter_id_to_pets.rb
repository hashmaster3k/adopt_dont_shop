class AddAdopterIdToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adopter_id, :integer
  end
end
