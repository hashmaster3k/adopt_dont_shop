class AddAdoptedToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adopted, :boolean
  end
end
